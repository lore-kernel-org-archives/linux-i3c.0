Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF25C87FD3
	for <linux-i3c@archiver.kernel.org>; Fri,  8 Aug 2025 09:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phN39iMSZFyrdmQJTLrLMfLBDfHLLK6doslFuPtaaVE=; b=MbfxXkMSIWIRg5
	u7krzDZwn1mCSIolA+2rjflmhGPJlCtFb0yr2EmDnT7lidewTKgQ/2ZiznjjBc1wh8318MpziJ0pm
	fbRD/7IyaKwnRuK8tS9Snh00dNrfnoOciza14WIqeHLPWovphyfdUKwzEgdGSdaS5HuFWqAXRX0cz
	S6L0zMTAdGXsIbINBy5BKFypIjmuk6hzdXD/IRI4w4kwnTlY9Dg8bYAFyZt6hRpzYUwYUS4dwocJi
	La9VEPQvkFVybzWStusmqckHvEhTwFnQd0i7SDQVmLzpwkh0ogXBTSpJkkBY7Aup2G1z0TMQnoLZ+
	VWACD8v4vz7MATPNtOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJdM-00000002TWW-1EqZ;
	Fri, 08 Aug 2025 09:43:32 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJdJ-00000002TVt-3Zkt
	for linux-i3c@lists.infradead.org;
	Fri, 08 Aug 2025 09:43:31 +0000
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-88bacb82a6dso399346241.3
        for <linux-i3c@lists.infradead.org>; Fri, 08 Aug 2025 02:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754646208; x=1755251008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHWNDK3s9P7e7V2iAmBr/rqn1vtS3VyQHGTysnO++tw=;
        b=QabZx5OEEn+rhNo3lxsoQETBzyyEDrPSuZyHiQ9wcmiqJqB2L+99/vJsU0pX5zleoz
         4+Mnr7aU3f3fxBl9PYMW89PryEaU0rbVsVnvFpu79aT9X4ktPNKW6j0Qrl+wXLBU7tcu
         nZtbRMdHiOP/R6FpnOZoPTSU/jTdXtI0wlBdCJy4h/s/WuhHbFuK/rQ9L0I7MY2pisxd
         8p756EXefoBTxP02MJoVsCNWesDD607hhjLLddbwJFkaUjo6Sc6ilsWAtS7oBQpqZLja
         dn3qwxMA5jMIN6MSX4Bqkb2lSNZlVZ66WjA1F+FYC0LjCbfSsOIYkGdWTsJdJx6rw13c
         fHVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpEjvfr9n89HKnm7Z0OPAPpZioM+tM9ghCrsBBxnft1/7obIchR1lCzYBHAwfcilCNBGQDzaRRZ/A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOPAQInXp+/uMvERjKlzPXZRvpBeyDhspLLi55kk2qneMkcXmg
	/ZeO0Md5ceY07rwFAhyxjRW7tgluB4uIORvPYcdOmfg7mIUiSRsjdRJRm5D89OLg
X-Gm-Gg: ASbGncuKuHSkh0FpfPzH0/ORn+B1yz1oiO373m1DSdMv7KEk11XW9TgAEaoV/T3AX6F
	KfHm/sI1WoBWhco2+4Gyhdqyx48EVzZeceUXpRmyfOGDmpUehPFgbxrPHk/uOxUITlFG2mYl9TT
	24bHBqUsVYMBzPmWyyC3wc1fPJSF+RMSq8PUnADArl+HnH3PQNt1rShaBnewObhkFShg9LXeUg4
	WZnx7+Gto/VPToVaDg5b7+wVG23t2nLEjEpXPT+ehbxK4MBxFad+N3+8ZN9G7/k9QwgTMCnB5O6
	4vSi58RX9JoF5YOQVBFco8KwKGqhUk577nkaVixc3ZW011ouQnRzAxK2fny+EZRU57Ym8w1ee7R
	lmU041LfY7NxKFn3Q5QhdGFlst4DmAPgBcEQC7Sk4NTlquQzeb0kH/RjM71zH
X-Google-Smtp-Source: AGHT+IEDrQkzrg3U9P8HGvjUbE+/yOEGG2uuUNptzp3YxtdSbMObIr/v34KenzLGk9wvkjL0BVElzw==
X-Received: by 2002:a05:6102:8019:b0:4e7:db51:ea5d with SMTP id ada2fe7eead31-5060cd85eaemr847389137.6.1754646208306;
        Fri, 08 Aug 2025 02:43:28 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e029e751dsm663512241.26.2025.08.08.02.43.27
        for <linux-i3c@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:43:28 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-504dd871d70so614605137.0
        for <linux-i3c@lists.infradead.org>; Fri, 08 Aug 2025 02:43:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUv0DqLvV4KBRl6n0yRD4gnJs6mDP5mHseXSzYojVxCP0+ebhdcvEMMP6eIUh/wguWqjOEqZNwFCOk=@lists.infradead.org
X-Received: by 2002:a05:6102:32cb:b0:4e5:8b76:44c5 with SMTP id
 ada2fe7eead31-5060f0cc794mr693639137.22.1754646207387; Fri, 08 Aug 2025
 02:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250807043456.1624-2-wsa+renesas@sang-engineering.com> <2025080720214218750df5@mail.local>
In-Reply-To: <2025080720214218750df5@mail.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Aug 2025 11:43:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwC=TNvvwf0_sgSSYTBGeq8UX5kRFN5kg3mFJ7wVA3kw@mail.gmail.com>
X-Gm-Features: Ac12FXzrLiEtwQSwABN_PovuC7CdyhBuG0HPwAa8_g9H9GakHs5gEOATJhO9jEM
Message-ID: <CAMuHMdUwC=TNvvwf0_sgSSYTBGeq8UX5kRFN5kg3mFJ7wVA3kw@mail.gmail.com>
Subject: Re: [PATCH] i3c: remove 'const' from FIFO helpers
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, Frank Li <Frank.Li@nxp.com>, 
	Jorge Marques <jorge.marques@analog.com>, linux-i3c@lists.infradead.org, 
	sparclinux <sparclinux@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_024329_888073_CDF56345 
X-CRM114-Status: GOOD (  26.43  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

CC sparclinux, arnd

On Fri, 8 Aug 2025 at 01:09, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 07/08/2025 06:31:24+0200, Wolfram Sang wrote:
> > As buildbot reports, some architectures do not want const pointers.
> >
> > Fixes: 733b439375b4 ("i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202508070438.TZZA3f2S-lkp@intel.com/
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > I still wonder why SPARC discards the const but since nobody seems to be
> > commenting on that, I guess the fastest way to get the build error out
> > of Linus' tree is to adapt the usage in I3C.
>
> My plan was to let sparc people handle their mess, there is no reason
> const should be discarded.

Fully agreed.

Note that it is not just the const keyword that is missing from the
SPARC implementation, but also the volatile keyword.

> > --- a/drivers/i3c/internals.h
> > +++ b/drivers/i3c/internals.h
> > @@ -30,8 +30,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
> >   * @buf: Pointer to the data bytes to write
> >   * @nbytes: Number of bytes to write
> >   */
> > -static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
> > -                                int nbytes)
> > +static inline void i3c_writel_fifo(void __iomem *addr, void *buf, int nbytes)
> >  {
> >       writesl(addr, buf, nbytes / 4);
> >       if (nbytes & 3) {
> > @@ -48,8 +47,7 @@ static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
> >   * @buf: Pointer to the buffer to store read bytes
> >   * @nbytes: Number of bytes to read
> >   */
> > -static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
> > -                               int nbytes)
> > +static inline void i3c_readl_fifo(void __iomem *addr, void *buf, int nbytes)
> >  {
> >       readsl(addr, buf, nbytes / 4);
> >       if (nbytes & 3) {
> > --
> > 2.47.2

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
