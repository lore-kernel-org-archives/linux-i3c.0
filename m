Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0760BC83029
	for <linux-i3c@archiver.kernel.org>; Mon, 30 Jun 2025 19:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AoZ9SZmRW9NQbiLwf5h45dCcY21iV3Ga7WvFxp/KPM=; b=g17RIO6WtAnQRG
	d4gE2eDHbjv+RXzF3+Mz3Kr7TezVFjk/SHrQJZ2RIuGjaUxET13WsxQjDVfcqaFwkBU8OSGl/pLLC
	mGcKSgtZ/nOBJR4pHoZahP2KZGWkeyXCFvQUM4fpiYWLrzxuuk3SnC7jCZvVmo1vTPuo9RvFS2IAH
	Bmao1s4quVKVyEC9hHNqzxxmIk0RAy6l4XfFj73uiC3OHResJZCYZb5/ycXdq/H6A0jKGbpmBkvHD
	O971v39/fQ1VP6NmiDZCbKN9CULUZv3TfpZ8sfHClz93slgxYd5THaFVFzDKmSWsjKYJoX7UTW4gi
	pjB74vd/ygzJO3al4zPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWKPf-00000003Jx3-3LAn;
	Mon, 30 Jun 2025 19:43:35 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWKPV-00000003Juy-02FZ
	for linux-i3c@lists.infradead.org;
	Mon, 30 Jun 2025 19:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IJoM
	IVa5E7Hv4lTIbN8oe9WV112gVPK/DBDuckoPA8I=; b=bK1k/aTnRAnoUYMIsbJ/
	mF45GKFrR9eHehYS1mqtiHqyzfRNq9cNsw4+IfUNj4WVcKKB7lvP/HJLw6SzJJoF
	8E10p10UeMq6thC2qCvOCxT7qF/fiInbNUh2gWyBibITABwtyc6FeAEsoTvZxbgx
	LadI7dk2OGvoY0ohkOWEVqp5IzoijRY/xovZyGhVND2eTvbe1dCcmFKupbHN2QDH
	Q2Zm/T9k5txjCRMHS54AYOm8nyUN/Sk9qbPGX7tulcBY7hMlSJf0h8G9/DXXcYQi
	Syh0OpydatoUpgN9jKaNeQH+P8fYm+dZoYSLPh5Rs77hVyKmbYaa2uv+qOJzQkLd
	Cw==
Received: (qmail 2683149 invoked from network); 30 Jun 2025 21:43:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jun 2025 21:43:19 +0200
X-UD-Smtp-Session: l3s3148p1@sIxbPc84RqAgAwDPXyUmAP5FmBXRrw7R
Date: Mon, 30 Jun 2025 21:43:18 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <aGLo1mlrHT_IZHQv@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
 <20250625200709.GA2125481-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625200709.GA2125481-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_124325_923616_9B7EFD83 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
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


> > +  interrupt-names:
> > +    items:
> > +      - const: ierr
> > +      - const: terr
> > +      - const: abort
> > +      - const: resp
> > +      - const: cmd
> > +      - const: ibi
> > +      - const: rx
> > +      - const: tx
> > +      - const: rcv
> > +      - const: st
> > +      - const: sp
> > +      - const: tend
> > +      - const: nack
> > +      - const: al
> > +      - const: tmo
> > +      - const: wu
> > +      - const: exit
> > +    minItems: 16
> > +
> > +  clocks:
> > +    oneOf:
> > +      - items:
> > +          - description: APB bus clock
> > +          - description: transfer clock
> > +      - items:
> > +          - description: APB bus clock
> > +          - description: SFRs clock
> > +          - description: transfer clock
> 
> It's a new binding, why don't you put SFRs clock last and simplify the 
> schema?

Similar how we handle interrupts? 16 for the one SoC, 17 for the other?
Putting the optional entry to the end of the array? Tommaso, can you
integrate this change, please?


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
