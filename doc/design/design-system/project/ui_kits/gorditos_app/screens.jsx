/* GorditOS app — screens. Composes design-system primitives from the bundle.
   Attaches all screens to window for the shell (app.jsx) to consume. */

const DS = window.GorditOSDesignSystem_613d73;
const { Button, IconButton, Badge, Chip, Card, Avatar, Input, Switch,
        SegmentedControl, GordiBubble, ProgressRing, HabitTile, GardenGrid } = DS;

const GORDI = '../../assets/gordi.svg';
const pad = 'var(--screen-pad)';

function ScreenHead({ eyebrow, title, right }) {
  return (
    <div style={{ display: 'flex', alignItems: 'flex-end', justifyContent: 'space-between', padding: `8px ${pad} 4px` }}>
      <div>
        {eyebrow ? <div style={{ fontFamily: 'var(--font-mono)', fontSize: 12, letterSpacing: 'var(--ls-label)', textTransform: 'uppercase', color: 'var(--ink-500)' }}>{eyebrow}</div> : null}
        <h1 style={{ fontFamily: 'var(--font-display)', fontSize: 'var(--text-h1)', color: 'var(--ink-900)', margin: '2px 0 0' }}>{title}</h1>
      </div>
      {right}
    </div>
  );
}

/* ───────────────────────── HOY ───────────────────────── */
function HoyScreen({ openGordi, openProfile }) {
  const [done, setDone] = React.useState({ agua: true, mover: false, comida: false, calma: false });
  const t = (k) => setDone((d) => ({ ...d, [k]: !d[k] }));
  const count = Object.values(done).filter(Boolean).length;
  return (
    <div style={{ paddingBottom: 24 }}>
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `4px ${pad}` }}>
        <div>
          <div style={{ fontFamily: 'var(--font-mono)', fontSize: 12, color: 'var(--ink-500)', textTransform: 'uppercase', letterSpacing: 'var(--ls-label)' }}>Lunes, 10 jun</div>
          <h1 style={{ fontFamily: 'var(--font-display)', fontSize: 'var(--text-h1)', margin: '2px 0 0' }}>Hola, Valen 👋</h1>
        </div>
        <button onClick={openProfile} style={{ border: 'none', background: 'transparent', cursor: 'pointer', padding: 0 }} aria-label="Perfil">
          <Avatar initials="VA" size={44} />
        </button>
      </div>

      <div style={{ padding: `12px ${pad} 0` }}>
        <Card variant="tint" style={{ display: 'flex', gap: 12, alignItems: 'center' }}>
          <img src={GORDI} alt="Gordi" width="52" height="52" />
          <div style={{ flex: 1 }}>
            <div style={{ fontFamily: 'var(--font-body)', fontWeight: 700, fontSize: 15, color: 'var(--ink-900)' }}>Tip de hoy</div>
            <div style={{ fontFamily: 'var(--font-body)', fontSize: 14, color: 'var(--ink-700)', lineHeight: 1.45 }}>Bebe un vaso de agua nada más despertar. Pequeño gesto, gran energía 🌱</div>
          </div>
        </Card>
      </div>

      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `20px ${pad} 8px` }}>
        <h2 style={{ fontFamily: 'var(--font-display)', fontSize: 'var(--text-h3)' }}>Tus hábitos de hoy</h2>
        <Badge tone="green" mono>{count} de 4</Badge>
      </div>
      <div style={{ display: 'flex', flexDirection: 'column', gap: 10, padding: `0 ${pad}` }}>
        <HabitTile icon="💧" name="Beber agua" meta="6 / 8 vasos" color="var(--habit-agua)" done={done.agua} onToggle={() => t('agua')} />
        <HabitTile icon="🤸" name="Moverme un poco" meta="Rutina suave · 10 min" color="var(--habit-ejercicio)" done={done.mover} onToggle={() => t('mover')} />
        <HabitTile icon="🥗" name="Comida casera" meta="Hoy: salteado exprés" color="var(--habit-comida)" done={done.comida} onToggle={() => t('comida')} />
        <HabitTile icon="🧘" name="Un momento de calma" meta="3 min de respiración" color="var(--habit-calma)" done={done.calma} onToggle={() => t('calma')} />
      </div>

      <div style={{ padding: `16px ${pad} 0` }}>
        <Card style={{ display: 'flex', alignItems: 'center', gap: 16 }}>
          <ProgressRing value={4300} max={5200} label="4.300" sub="pasos hoy" size={104} color="var(--habit-pasos)" />
          <div style={{ flex: 1 }}>
            <div style={{ fontFamily: 'var(--font-display)', fontWeight: 700, fontSize: 16, color: 'var(--ink-900)' }}>Vas a tu ritmo</div>
            <p style={{ fontFamily: 'var(--font-body)', fontSize: 13.5, color: 'var(--ink-500)', marginTop: 4 }}>Tu objetivo se adapta a ti. Cada paso suma, sin presión.</p>
          </div>
        </Card>
      </div>

      <div style={{ padding: `14px ${pad} 0`, display: 'flex', gap: 10 }}>
        <Button variant="primary" block onClick={openGordi} icon="💬">Hablar con Gordi</Button>
        <Button variant="ghost" onClick={() => alert('Te propongo algo de 5 minutos 🌱')}>Hoy no puedo con todo</Button>
      </div>
    </div>
  );
}

/* ───────────────────────── JARDÍN ───────────────────────── */
function JardinScreen() {
  const days = ['grown','bloom','sprout','soil','grown','grown','bloom','soil','sprout','grown','grown','soil','bloom','grown','grown','sprout','soil','grown','bloom','grown','soil','grown','sprout','soil','grown','bloom','soil','soil','grown','grown'];
  return (
    <div style={{ paddingBottom: 24 }}>
      <ScreenHead eyebrow="Junio" title="Tu jardín" />
      <div style={{ padding: `8px ${pad} 0`, display: 'flex', gap: 10 }}>
        <Card style={{ flex: 1, textAlign: 'center' }}>
          <div style={{ fontFamily: 'var(--font-display)', fontWeight: 800, fontSize: 30, color: 'var(--green-600)' }}>18</div>
          <div style={{ fontFamily: 'var(--font-body)', fontSize: 13, color: 'var(--ink-500)' }}>días activos este mes</div>
        </Card>
        <Card style={{ flex: 1, textAlign: 'center' }}>
          <div style={{ fontFamily: 'var(--font-display)', fontWeight: 800, fontSize: 30, color: 'var(--apricot-600)' }}>21</div>
          <div style={{ fontFamily: 'var(--font-body)', fontSize: 13, color: 'var(--ink-500)' }}>tu mejor mes 🌸</div>
        </Card>
      </div>
      <div style={{ padding: `16px ${pad} 0` }}>
        <Card>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 12 }}>
            <h2 style={{ fontFamily: 'var(--font-display)', fontSize: 'var(--text-h3)' }}>Cada día que apareces, crece</h2>
          </div>
          <GardenGrid columns={7} days={days} />
          <div style={{ display: 'flex', gap: 14, marginTop: 14, flexWrap: 'wrap' }}>
            {[['var(--garden-soil)','Aún sin plantar'],['var(--garden-sprout)','Brote'],['var(--garden-grown)','Crecida'],['var(--garden-bloom)','Floreció']].map(([c,l]) => (
              <div key={l} style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
                <span style={{ width: 14, height: 14, borderRadius: 4, background: c }}></span>
                <span style={{ fontFamily: 'var(--font-body)', fontSize: 12.5, color: 'var(--ink-500)' }}>{l}</span>
              </div>
            ))}
          </div>
        </Card>
      </div>
      <div style={{ padding: `14px ${pad} 0` }}>
        <Card variant="tint" style={{ display: 'flex', gap: 12, alignItems: 'center' }}>
          <img src={GORDI} alt="Gordi" width="46" height="46" />
          <div style={{ fontFamily: 'var(--font-body)', fontSize: 14, color: 'var(--ink-700)', lineHeight: 1.45 }}>
            <b style={{ color: 'var(--ink-900)' }}>Aquí no se pierde nada.</b> Si faltaste unos días, tu jardín te espera tal cual. Se retoma sin culpa.
          </div>
        </Card>
      </div>
    </div>
  );
}

/* ───────────────────────── GORDI (chat) ───────────────────────── */
function GordiScreen() {
  const [msgs, setMsgs] = React.useState([
    { from: 'gordi', text: '¡Hola! Soy Gordi 🌱 ¿Cómo te encuentras hoy?' },
    { from: 'user', text: 'Un poco sin energía la verdad…' },
    { from: 'gordi', text: 'Te entiendo. ¿Probamos algo suave? Un vaso de agua y 5 minutos de estiramientos. Yo te acompaño y lo celebramos.' },
  ]);
  const [val, setVal] = React.useState('');
  const send = () => {
    if (!val.trim()) return;
    const u = val.trim();
    setMsgs((m) => [...m, { from: 'user', text: u }]);
    setVal('');
    setTimeout(() => setMsgs((m) => [...m, { from: 'gordi', text: '¡Genial que lo cuentes! Vamos pasito a pasito, sin prisa y sin presión 💚' }]), 600);
  };
  return (
    <div style={{ display: 'flex', flexDirection: 'column', height: '100%' }}>
      <ScreenHead eyebrow="Tu copiloto" title="Gordi" right={<Badge tone="green">en línea</Badge>} />
      <div style={{ flex: 1, overflow: 'auto', display: 'flex', flexDirection: 'column', gap: 12, padding: `12px ${pad} 16px` }}>
        {msgs.map((m, i) => (
          <GordiBubble key={i} from={m.from} avatarSrc={GORDI}>{m.text}</GordiBubble>
        ))}
      </div>
      <div style={{ padding: `10px ${pad} 16px`, background: 'var(--surface-card)', boxShadow: '0 -2px 16px rgba(74,56,30,.06)', display: 'flex', gap: 8, alignItems: 'center' }}>
        <input value={val} onChange={(e) => setVal(e.target.value)} onKeyDown={(e) => e.key === 'Enter' && send()} placeholder="Escribe a Gordi…" className="gds-input" style={{ flex: 1 }} />
        <Button variant="primary" size="md" onClick={send}>Enviar</Button>
      </div>
    </div>
  );
}

/* ───────────────────────── COCINA ───────────────────────── */
function CocinaScreen() {
  const [filter, setFilter] = React.useState('rapido');
  const recipes = [
    { emoji: '🥘', name: 'Salteado exprés de verduras', meta: '15 min · sartén', tag: 'rapido' },
    { emoji: '🍲', name: 'Lentejas de bote en 1 olla', meta: '20 min · batch', tag: 'nevera' },
    { emoji: '🥗', name: 'Bowl de garbanzos y aguacate', meta: '10 min · sin cocinar', tag: 'rapido' },
    { emoji: '🍳', name: 'Tortilla de calabacín', meta: '18 min · nevera normal', tag: 'nevera' },
  ];
  const shown = recipes.filter((r) => filter === 'todo' || r.tag === filter);
  return (
    <div style={{ paddingBottom: 24 }}>
      <ScreenHead eyebrow="Sin dietas" title="Cocina" />
      <div style={{ display: 'flex', gap: 8, padding: `8px ${pad}`, overflowX: 'auto' }}>
        <Chip selected={filter === 'rapido'} onClick={() => setFilter('rapido')}>≤30 min</Chip>
        <Chip selected={filter === 'nevera'} onClick={() => setFilter('nevera')} icon="🧊">Lo que tengo</Chip>
        <Chip selected={filter === 'todo'} onClick={() => setFilter('todo')}>Todo</Chip>
      </div>
      <div style={{ display: 'flex', flexDirection: 'column', gap: 10, padding: `4px ${pad} 0` }}>
        {shown.map((r) => (
          <Card key={r.name} interactive style={{ display: 'flex', gap: 14, alignItems: 'center' }}>
            <div style={{ width: 56, height: 56, borderRadius: 'var(--radius-md)', background: 'var(--apricot-50)', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 28 }}>{r.emoji}</div>
            <div style={{ flex: 1 }}>
              <div style={{ fontFamily: 'var(--font-display)', fontWeight: 600, fontSize: 16, color: 'var(--ink-900)' }}>{r.name}</div>
              <div style={{ fontFamily: 'var(--font-body)', fontSize: 13, color: 'var(--ink-500)' }}>{r.meta}</div>
            </div>
            <span style={{ color: 'var(--ink-400)', fontSize: 20 }}>›</span>
          </Card>
        ))}
      </div>
      <div style={{ padding: `16px ${pad} 0` }}>
        <Card variant="flat" style={{ fontFamily: 'var(--font-body)', fontSize: 12.5, color: 'var(--ink-500)', lineHeight: 1.5 }}>
          Ideas orientativas, sin calorías ni gramos. Para una pauta personalizada, consulta a un dietista-nutricionista colegiado.
        </Card>
      </div>
    </div>
  );
}

/* ───────────────────────── ONBOARDING ───────────────────────── */
function OnboardingScreen({ onDone }) {
  const [step, setStep] = React.useState(0);
  const [feel, setFeel] = React.useState('energia');
  const [nivel, setNivel] = React.useState('empezando');
  const steps = [
    {
      title: '¿Cómo te quieres sentir?',
      sub: 'Esto guía a Gordi. Nunca te pediremos peso, altura ni edad.',
      body: (
        <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
          {[['energia','⚡','Con más energía'],['calma','🧘','Más en calma'],['fuerte','💪','Más en forma'],['constante','🌱','Constante, sin agobios']].map(([v,e,l]) => (
            <button key={v} onClick={() => setFeel(v)} className="gds-card" style={{ display: 'flex', gap: 12, alignItems: 'center', cursor: 'pointer', border: feel === v ? '2px solid var(--green-500)' : '2px solid transparent', background: feel === v ? 'var(--green-50)' : 'var(--surface-card)', textAlign: 'left' }}>
              <span style={{ fontSize: 24 }}>{e}</span>
              <span style={{ fontFamily: 'var(--font-display)', fontWeight: 600, fontSize: 16, color: 'var(--ink-900)' }}>{l}</span>
            </button>
          ))}
        </div>
      ),
    },
    {
      title: '¿Por dónde empezamos?',
      sub: 'Tú marcas el ritmo. Puedes cambiarlo cuando quieras.',
      body: (
        <div style={{ display: 'flex', flexDirection: 'column', gap: 16, alignItems: 'flex-start' }}>
          <SegmentedControl value={nivel} onChange={setNivel} options={[
            { value: 'empezando', label: 'Empezando' },
            { value: 'ritmo', label: 'Cogiendo ritmo' },
            { value: 'marcha', label: 'En marcha' },
          ]} />
          <Input label="Sin gimnasio: ¿qué tienes en casa?" placeholder="Ej. una esterilla y ganas" />
        </div>
      ),
    },
    {
      title: 'Te presento a Gordi',
      sub: 'Tu copiloto. Te acompaña, te celebra y nunca te juzga.',
      body: (
        <div style={{ textAlign: 'center', padding: '8px 0' }}>
          <img src={GORDI} alt="Gordi" width="140" height="140" />
          <GordiBubble from="gordi" avatarSrc={GORDI}>¡Encantado! Vamos a tu ritmo, ¿vale? 🌱</GordiBubble>
        </div>
      ),
    },
  ];
  const s = steps[step];
  const last = step === steps.length - 1;
  return (
    <div style={{ display: 'flex', flexDirection: 'column', height: '100%', padding: `4px ${pad} ${pad}` }}>
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '4px 0 14px' }}>
        <div style={{ fontFamily: 'var(--font-display)', fontWeight: 800, fontSize: 22 }}>Gordit<span className="gordi-os-accent" style={{ color: 'var(--green-600)', fontSize: 17 }}>OS</span></div>
        <button onClick={onDone} style={{ border: 'none', background: 'transparent', fontFamily: 'var(--font-body)', fontWeight: 700, color: 'var(--ink-500)', cursor: 'pointer' }}>Saltar</button>
      </div>
      <div style={{ display: 'flex', gap: 6, marginBottom: 18 }}>
        {steps.map((_, i) => (
          <span key={i} style={{ height: 6, flex: 1, borderRadius: 99, background: i <= step ? 'var(--green-500)' : 'var(--sand-300)', transition: 'background var(--dur-base)' }}></span>
        ))}
      </div>
      <h1 style={{ fontFamily: 'var(--font-display)', fontSize: 'var(--text-h1)', color: 'var(--ink-900)' }}>{s.title}</h1>
      <p style={{ fontFamily: 'var(--font-body)', fontSize: 15, color: 'var(--ink-500)', margin: '6px 0 20px', lineHeight: 1.5 }}>{s.sub}</p>
      <div style={{ flex: 1, overflow: 'auto' }}>{s.body}</div>
      <div style={{ paddingTop: 14 }}>
        <Button variant="primary" size="lg" block onClick={() => (last ? onDone() : setStep(step + 1))}>
          {last ? 'Empezar a mi ritmo' : 'Siguiente'}
        </Button>
      </div>
    </div>
  );
}

Object.assign(window, { HoyScreen, JardinScreen, GordiScreen, CocinaScreen, OnboardingScreen });
