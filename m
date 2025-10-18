Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C42CCD195
	for <linux-i3c@archiver.kernel.org>; Sat, 18 Oct 2025 13:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Ph3VaoK2SDjabopFkdasYGQXmzwnU3fju+3KUOqLKA=; b=KU+CtKuVPfdvbC
	Qr4ssBstFAWLOybpbd6vj5nW31Ja0Ulf1JPxQAjSABd7Ryxs+U1rhnZcKbTLEfi4cX6DKyo06XQqG
	mr9jq7Q4cq19yYAXHaKTR6lg8rYUb95voIFC2qn0k1JXKKYVgHqD8Wjrnj5IAGGHnEy2fFPv4rWEi
	fV6o4TQuTabeMhls2wYRrSP7n7ftl7oL/zr7D8sSfpBkhgnGxYVY1g701x3xHwRfEZUpxcq8IpJDK
	UUZD/cw3bVirMZnL12WrcW75IsF7Uu2A8cbKV9T+xwXT6/QysH9GUqwqA6nSVSecmNnjZbd64BqlZ
	UmOTc5iOWj/xrsEbzM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA6mx-00000009xM6-0syT;
	Sat, 18 Oct 2025 13:16:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA6mv-00000009xM0-2Pfg
	for linux-i3c@lists.infradead.org;
	Sat, 18 Oct 2025 13:16:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5C3160243;
	Sat, 18 Oct 2025 13:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5B8C4CEF8;
	Sat, 18 Oct 2025 13:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760793360;
	bh=hysF+JKp4Ag3WbayIb6tgZXGP0K/o0xHdRxBPWpRpuE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FTY/bGz5F3a8sPgALBriMkN5WvJ0ojLBrrwANQhMz+rrRYVlFkt/tZ2nfc3j3vd5F
	 PPXYmgCmDV1HOXJ3TVz+74sMoFM9ooQxek393jUOzESFnfFjkQx0kOvjfFcOJ9DwFt
	 UiGoNB6ulQZZ6Vr29bDOB3eG5rBJTvSks+2wIsJ9L28cVhHLy6vFCjIg0v66tHCjSg
	 nrs4JuznCMcZ5VxlhVHRsQcHsFeIorw+t/XDz/N0+yE81ljS4yYqHr/vj/qgnZcYcI
	 Ku7CwxVJS9dagT5ue0M1ehdOmgaojTcuf8xHKYWvRt82LwEdxG1yGC010euKg9OWxz
	 Jgqxx9jC5vqDg==
Date: Sat, 18 Oct 2025 14:15:51 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
 devicetree@vger.kernel.org, Carlos Song <carlos.song@nxp.com>, Adrian
 Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: Add basic HDR mode support
Message-ID: <20251018141551.3e5c46c1@jic23-huawei>
In-Reply-To: <2025101319545551cfb399@mail.local>
References: <20251007-i3c_ddr-v5-0-444184f7725e@nxp.com>
	<20251012180327.5d94dda2@jic23-huawei>
	<2025101319545551cfb399@mail.local>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Mon, 13 Oct 2025 21:54:55 +0200
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> On 12/10/2025 18:03:27+0100, Jonathan Cameron wrote:
> > On Tue, 07 Oct 2025 16:06:12 -0400
> > Frank Li <Frank.Li@nxp.com> wrote:
> >   
> > > Add basic HDR mode support, only support private transfer, not support
> > > CCC command.
> > > 
> > > Update i3c framework API to allow pass down mode and extend driver callback
> > > function.
> > > 
> > > Implement HDR transfer in svc i3c master driver.
> > > 
> > > Simplifed HDR flow is (ref i3c spec line 5514) Figure 129
> > > 
> > > <--              SDR            ---> | <--- HDR
> > > START 0x7E RnW(0) ACK CCC(ENTHDR0) T   HDR-CMD(00-7f write, 80--ff read)
> > >   
> > >                                     ----> |    
> > > HDR-DATA HDR-CRC HDR-RESTART .... HDR-EXIT
> > > 
> > > Note: HDR-CMD is 16bit data, which included 7bit slave address and 8bit
> > > read/write command.
> > > 
> > > svc hardware can auto issue SDR part.
> > > 
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>  
> > 
> > Whilst there will probably have to be a v6 for the ACPI ID issue in patch 5,
> > I'd like to ask the question of how are we planning to merge this?
> > 
> > Maybe an immutable branch either in IIO or I3C trees that the other one picks up?
> > 
> > It's a new driver so could gamble on taking the IIO driver the I3C tree but even
> > then I'd like a topic / immutable branch in case any IIO wide refactors or similar
> > hit this cycle.
> >   
> 
> I can definitively provide an immutable branch once this goes in or if
> you are more comfortable with this, I guess there is no urgency and we
> could apply this over two cycles, first the I3C part and then you can
> take the driver.
> 
Mostly because I'm really forgetful and hence don't like tracking stuff over
multiple cycles, I'd prefer an immutable once all patches are ready to go.

Thanks,

Jonathan

> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
