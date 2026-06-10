/* GorditOS app shell — device frame, screen routing, bottom nav. */
const DS_ = window.GorditOSDesignSystem_613d73;
const { BottomNav } = DS_;
const { IOSDevice } = window;
const { HoyScreen, JardinScreen, GordiScreen, CocinaScreen, OnboardingScreen } = window;

function App() {
  const [onboarding, setOnboarding] = React.useState(true);
  const [tab, setTab] = React.useState('hoy');

  let screen;
  if (tab === 'jardin') screen = <JardinScreen />;
  else if (tab === 'gordi') screen = <GordiScreen />;
  else if (tab === 'cocina') screen = <CocinaScreen />;
  else screen = <HoyScreen openGordi={() => setTab('gordi')} openProfile={() => setOnboarding(true)} />;

  return (
    <IOSDevice>
      <div style={{ height: '100%', display: 'flex', flexDirection: 'column', background: 'var(--bg-app)', fontFamily: 'var(--font-body)' }}>
        {onboarding ? (
          <OnboardingScreen onDone={() => { setOnboarding(false); setTab('hoy'); }} />
        ) : (
          <>
            <div style={{ flex: 1, overflow: 'auto', paddingTop: 6 }}>{screen}</div>
            <div style={{ paddingBottom: 20, background: 'var(--surface-card)' }}>
              <BottomNav current={tab} onChange={setTab} items={[
                { id: 'hoy', icon: '☀️', label: 'Hoy' },
                { id: 'jardin', icon: '🌱', label: 'Jardín' },
                { id: 'gordi', icon: '💬', label: 'Gordi' },
                { id: 'cocina', icon: '🥗', label: 'Cocina' },
              ]} />
            </div>
          </>
        )}
      </div>
    </IOSDevice>
  );
}

ReactDOM.createRoot(document.getElementById('root')).render(<App />);
