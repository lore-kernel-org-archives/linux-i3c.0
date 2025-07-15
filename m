Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD38C83F1D
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Jul 2025 09:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/4y6794hOJsinA1xDChVyyChVHYgjjPVexwHnI6uN0=; b=2RRA91ioRNxwfa
	dTqWGBNy068la5GJyuACGsf5sOR+mzQvhLzIp9p2eyOGcoGjUzoi+i3Mmjgw5RJDB3kgZECYXP2qt
	5sHStShFjt+1o/jJATOT5SqwjQMbyBynwLFBbhUHyjaS9Rrr+dIuXSHvMsvljmhAZbcEI1pWXkie4
	VRApUB51kWLP08+VwLnU/DQ4LMlSWrF7xcI8X9qsBNc4u3KRH5pws+fhik6aifPYfZUGYOKcpZyz7
	+TNlG3uTQXdHtSrAWvk6y8G0j+fR49sS8tIriNP0KUT76swvW78tKhLq3ZpsPU0itkeiSh7TZTXwv
	zP2JUpY24o9GtkwTMc3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbz9-00000004gD3-1tw0;
	Tue, 15 Jul 2025 09:30:03 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbM1-00000004Zjw-3Zax
	for linux-i3c@lists.infradead.org;
	Tue, 15 Jul 2025 08:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Sywa
	sp0aNghKdI+BXx2W0GdIAOcfY73wopCUSjG9ySg=; b=jNxSiwWC2Zx4d8QwU5xo
	0HOwmswbb+bqh8J8x5tVDU7ipPmu2UKy3p8TVTIGeKCzgSAh55Ip2IhZXoatWdWL
	xJ8IQdihcZdCten9QQpQMjpQvrysbPh7W5ZTksiACL0Mikl7lItaF21kYWORreS7
	x0oQL7OTWItaaI7Kg96JOlwARiUdaG9ZIcJ0n31uVHyIoXMtNByOZLsdwTbEkNwc
	r6rPZyJIKlDE5AXPbEEip8D+VCKS88Wn3mZMv4ym/htvJDF9udvthxdFad6/y8mJ
	fSJESRLTaiGs0+MqAVjwdoeIfCBYt4LOnom+Gy58Ll7bs23AUd254hn0uZoBcAR1
	6A==
Received: (qmail 2809330 invoked from network); 15 Jul 2025 10:49:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2025 10:49:34 +0200
X-UD-Smtp-Session: l3s3148p1@hYf32vM5lsUgAwDPXx+vAAkEB0lWxGP4
Date: Tue, 15 Jul 2025 10:49:33 +0200
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
Subject: Re: [PATCH 1/2] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <aHYWHcns6SRSM5uA@shikoro>
References: <20250714091211.20497-1-wsa+renesas@sang-engineering.com>
 <20250714091211.20497-2-wsa+renesas@sang-engineering.com>
 <20250715034441.GA4186417-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250715034441.GA4186417-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_014938_170453_CA15ACD5 
X-CRM114-Status: UNSURE (   8.64  )
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


> > +      - enum:
> > +          - renesas,r9a08g045-i3c # RZ/G3S
> > +          - renesas,r9a09g047-i3c # RZ/G3E
> 
> You already have to have differences between these 2. So how are they 
> the same and compatible with this:
> 
> > +      - const: renesas,i3c
> 
> Even without a difference, this seems like it will be short lived for 
> how many SoC will be compatible with it (though we get to keep it 
> forever). 

Ack, will drop. Thanks for the review!


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
