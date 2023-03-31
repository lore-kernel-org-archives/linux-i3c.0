Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C4EC7619A
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Mar 2023 02:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrygGltzICK7UurwyvDZ1qd9eut1FPlzj8BkJEV6e/w=; b=ZmjPgsDwXJvu56
	hiNxzuKJDYMf37s5JVrVTMYbEAVCqnL2FDk4ntGOT8mgdq3rdiYXFyj2TeoXZmiiMDSxyrCLehcFL
	oMGDOpHJ0Iyp6elOv5d0grJjI31+3g695kXpzbu2dWtyhK2sqC84uj2/5MYXv1U+HXC212fBZDhlM
	GExYH+81L3cKKXAcPcBZxWcVtLcyiBdwNJPx9SjKN/bRhOsoXwEvTheEb7wyw8EaVlsT+jlzxjymo
	pOLZORMIrcTpvAt7qRFiq/FvCYwg592KcibGTJcxgtKFqVyT6ash8J+ibFDi2VadHbHq39LsvOKnK
	5Eq3tEACzvNBKvb/OcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi4aD-005dRK-33;
	Fri, 31 Mar 2023 02:33:41 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi4aA-005dQC-1s
	for linux-i3c@lists.infradead.org;
	Fri, 31 Mar 2023 02:33:41 +0000
Received: from [192.168.191.192] (pa49-196-168-189.pa.vic.optusnet.com.au [49.196.168.189])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 26CC7200DB;
	Fri, 31 Mar 2023 10:33:36 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680230016;
	bh=P9UdsgxN131/GqgsNvVJGmSkX4tHdz+XN8KYKl1UhrU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ND4mfBPO4a25IE9UZWCoKSsS2S5irou6RMzdTntGVXrAoERJXqaBe47iB0qMGSnBf
	 gZRh5MU08Ko4xfqsCeMbuKmBsirlup/+Ob4frRkRFrmgRWWHEIu0xBkHfYrcX2Gwtz
	 uhLdeBy7HLfySTht94pXqpJa4TDXixGaJg3T9TGkDo2xU/5EdKz43l+nkHG0L4gYyF
	 0ZglgiySbea7ziwvwX/lY23WLBuSBGh/PFb9njXQuVIAxqpG4KICuYDl5SRc0/6ZLq
	 Vb88751gk8GWlx+2isSoDwNv407xfwkQu23sk+3mf/BYzoUjbs9EXQAz/hCJk4l0Rn
	 37bxyNH283ocg==
Message-ID: <48906ed40dbf34a28cb9bcc2569d113abd88e409.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/3] i3c dw,ast2600: Add a driver for the AST2600 i3c
 controller
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Jack Chen <zenghuchen@google.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, Matt Johnston
 <matt@codeconstruct.com.au>, Vitor Soares <ivitro@gmail.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>,  Dylan Hung <dylan_hung@aspeedtech.com>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date: Fri, 31 Mar 2023 10:33:35 +0800
In-Reply-To: <CALvyBcV9EnwgcuNXF=uUwdQZ=WHjmpinD=s0FkL=KC0OBTwXBA@mail.gmail.com>
References: <cover.1680160851.git.jk@codeconstruct.com.au>
	 <CALvyBcV9EnwgcuNXF=uUwdQZ=WHjmpinD=s0FkL=KC0OBTwXBA@mail.gmail.com>
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_193338_809177_53E15E10 
X-CRM114-Status: GOOD (  10.18  )
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

Hi Zenghu,

> Thanks for the change, especially IBI features in other threads.
> From my understanding, ASPEED AST2600 is a SoC which uses Synopsys'
> I3C IP core, and several different registers, especially the pull-up
> resistor.
> If so, I am wondering if this is the right place to add
> ast2600-i3c-master.c, given that all current three xxx-i3c-master.c
> drivers in this directory are from IP providers directly.
> What about moving it under ~/driver/soc/?

It's my understanding that drivers/soc/ is for smaller parts of
SoC-specific functions, rather than implementing SoC driver instances
for existing subsystems.

I'd prefer to keep it with the i3c controller drivers; this means we can
keep the dw platform API as contained as possible (ie., within
drivers/i3c/master/). I expect that we will need some coordination of
changes until we have the platform-specific behaviour mostly described
(see the IBI series for another hook), and so coordinating changes
between drivers/soc/ and drivers/i3c/ may make things more complicated
than necessary.

There's certainly precedence for this pattern:

 * the aspeed ethernet mac is provided by the ftgmac100 driver plus some
   SoC-specific behaviour; that's entirely within drivers/net/

 * the aspeed VUART device is essentially a 16550 plus extra registers;
   that's entirely within drivers/tty/

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
