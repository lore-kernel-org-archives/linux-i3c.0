Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF482CA101F
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Sep 2025 06:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ickJmV3l3ifaXrgLIlbyNQOPi4Z2BMNNmsbfVPWyLE=; b=dmqn1WKPMFTDFL
	nbuU95QkJa+sk7l1FVcypv3GukkbGhVbP6ylGaHcWEhCSrUv7cLp68/eg8sD8xm42g/hs2ZMq4XTC
	9Nj3vA1/haEC6wGppq/hBGlI8PCNOXIK25bKYtzuPm19l36bahF8h/nE1itaIPEs7SAwV9ULq6Q1P
	L5HQd/yyhxh5TmHuUrYAhjU4e4D27AoZ87Aod0XfBIAXqKZqhfxE5FzvGjBt9BRS2Ft4g+mXTFfeu
	xPSAzeX9OixYdqYvQmxycezGV3RVs/dlN96wHV131/eshXmr9bBaeyySU8QBu6rfpGcXDFgkPiS4m
	42qMR5jG/FQN3Jxdvh5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEiK-0000000CLy4-2pT0;
	Wed, 10 Sep 2025 06:53:56 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEiG-0000000CLw8-1D6v
	for linux-i3c@lists.infradead.org;
	Wed, 10 Sep 2025 06:53:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3QtE
	MO80KSRXHHcQR8iUtZcbvRTUZ2MQ4g/xitu0XMA=; b=X+03SsaUtrd32NsYB/ek
	Utpb54jRVdJDLObVVwoDyiusfnS9O2OyeGgQiBpDjgotrjKW/0x5pZScoBm6XFSa
	moWMpTEnJzn845L+uck2N1Pv8KtIBPdx+MXXg/YRTJ289Ms4Emvu8qc3otno6ane
	OgePiIUXNIV76JoX8RyBMwC0B2u0YVIgV7Jt0v2QMtBwVrB3nVKW02con7gKwmLF
	pdCYGFN/U9HXgYqk6RNRe+f4LZp/uDhZS6T+etrY7nL8zBYQg90JUdISfCWI8A3+
	J+S48TZAzOcQtmu5BtZtw0MfR/LaAYZYhuG97/alxh2IJiuS6Ygd7nkR3RWHnK6v
	cA==
Received: (qmail 500977 invoked from network); 10 Sep 2025 08:53:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Sep 2025 08:53:45 +0200
X-UD-Smtp-Session: l3s3148p1@OJ+94Ww+VOwgAwDPXyerAKQ7QDbxBzog
Date: Wed, 10 Sep 2025 08:53:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Durai.ManickamKR@microchip.com
Cc: Frank.li@nxp.com, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Balamanikandan.Gunasundar@microchip.com,
	Nicolas.Ferre@microchip.com
Subject: Re: [PATCH 2/4] i3c: master: add Microchip SAMA7D65 I3C HCI master
 driver
Message-ID: <aMEgeHLnrDyGjYM3@shikoro>
References: <20250909111333.170016-1-durai.manickamkr@microchip.com>
 <20250909111333.170016-3-durai.manickamkr@microchip.com>
 <aMCZw2v8Ey6aGbqk@lizhi-Precision-Tower-5810>
 <3229da67-9d67-47ff-9f01-0d71bfabb6a6@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3229da67-9d67-47ff-9f01-0d71bfabb6a6@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_235353_197667_B05158B6 
X-CRM114-Status: GOOD (  19.22  )
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

Hi Durai,

> 1. To introduce a Microchip SoC specific macro to add Microchip specific 
> I3C changes to the existing driver. But in this approach, if suppose we 
> have a changes in the i3c-hci driver, we have to adapt the changes to 
> our IP also during every kernel updation and I donot know whether this 
> is accepted by the i3c-hci driver maintainer.
> 
> 2. Otherwise, creating a separate platform driver by reusing the 
> existing i3c-hci driver.

Usually, 2) is the way to go for the reason you gave above. If there are
fixes to the core part, you don't need to sync with your driver.
Maintenance burden is lower for most of the times.

If the hardware is so different that the modifications to the core
driver turn out to be more complex (and harder to maintain) than a
seperate driver, then 1) can be an option.

Without knowing your hardware, from the description above I'd think you
can reuse the existing HCI core driver. It is mainly about not using
stuff like DMA. Maybe that can be handled with newly introduced quirk
flags.

> I raised a query few weeks back to decide which approach to proceed 
> before sending this patch to upstream. But i have received comments like 
> "its upto us to decide which is best way". I dont have much idea on 
> which is best way to proceed and maintain.So, I have decided to go with 
> approach 2.

Your patch looks like approach 1), though? You don't hook into the HCI
driver or am I overlooking this?


> >> Features tested and supported :
> >>     Standard CCC commands.
> >>     I3C SDR mode private transfers in PIO mode.
> >>     I2C transfers in PIO mode.
> >>     Pure bus mode and mixed bus mode.
> >>
> >> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>

Please delete lines you don't quote anymore (here, the whole driver).

Happy hacking,

   Wolfram


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
