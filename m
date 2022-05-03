Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A52C433EF
	for <linux-i3c@archiver.kernel.org>; Tue,  3 May 2022 21:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NPf7S2TYqmWBmTcam2ntrhgAoGV3Z+1fGrSNDhaQMo=; b=JNaijew/1Nw90H
	bT8jbBh+85J5ARlNAlWsA/XPPQFT7oas+D/pqPHoVeTEUiHOc79S0ohiv4Vra465H9qadHygeNf2q
	fT/zBQassGLClyNZpT/n6yMLqmCldKymXl0Y1zPdwm1EccRT2MNstvEnWncUhE0gK249goS1v+Mky
	fRVbraKdy/tJEDVsat4UwvgiaOgtrNn81F+sFIIXncu4TK83lFvJaZfENckCIjinKoY+6sp0LnI3/
	JY4VgUHgA1qYIdXZMdbwVeaLhKrPfZbiJp1mqgsww2fOLjy9EWIonmBQOPPdpBCb36HJaZQ+UOqHj
	ynbbSzQVyNsjLIyRfelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm0EH-007omi-Jr; Tue, 03 May 2022 21:38:45 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm0EE-007ol1-KV
 for linux-i3c@lists.infradead.org; Tue, 03 May 2022 21:38:44 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 11698100002;
 Tue,  3 May 2022 21:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651613920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4e7Sv65BlxtfCAwzzTiuAVRpHIHdlis0/EJW+hJswEM=;
 b=X7S2yyiEWsrUJc/EzPA6b/XIba4Qkz6NHaXC8NYel22mP41XVCzF/J7ygJzIgYT6txCoNa
 s0gX4c+AS8TNumhap7CnxoqFib11natedG1Bz9jkLkN88NmbsUsQP377V5aa7GqrIu2DWF
 xMUvoBc1N8yJa1jRQ0k4Vff5AuOMlItYoIgOkZCe0IQP7p8cPgj5ljWT5TUDVeIcx0FUFm
 FdNXeN9YVL/HsWGaN+uiv6UPSuvNw+vHL6xT4RRvTrWZhuag7kOS35ctN2S/NHibJHN0wV
 9uOKfdVGcImQ5swSW6FxxbvJUJs5nTmSsa+Zxay29uVNpfOD5ChZtIuIKiFGfQ==
Date: Tue, 3 May 2022 23:38:39 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: i3c: Convert snps, dw-i3c-master to DT schema
Message-ID: <YnGg31lPwxAQOUtg@mail.local>
References: <20220422192236.2594577-1-robh@kernel.org>
 <CAL_Jsq+t5e-Dr0z9Zd_+jaqwb1afEVx4SdjbQZA4bHpWf8a2jg@mail.gmail.com>
 <YmMD3RPXfPdiYXyg@mail.local> <Ymb61YHl62AfSe2R@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ymb61YHl62AfSe2R@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_143842_983445_3A3C77BB 
X-CRM114-Status: GOOD (  21.44  )
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

On 25/04/2022 14:47:33-0500, Rob Herring wrote:
> On Fri, Apr 22, 2022 at 09:37:01PM +0200, Alexandre Belloni wrote:
> > On 22/04/2022 14:28:53-0500, Rob Herring wrote:
> > > On Fri, Apr 22, 2022 at 2:22 PM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > Convert the Synopsys Designware I3C master to DT schema format.
> > > >
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > >  .../bindings/i3c/snps,dw-i3c-master.txt       | 41 ---------------
> > > >  .../bindings/i3c/snps,dw-i3c-master.yaml      | 52 +++++++++++++++++++
> > > >  2 files changed, 52 insertions(+), 41 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> > > > deleted file mode 100644
> > > > index 07f35f36085d..000000000000
> > > > --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> > > > +++ /dev/null
> > > > @@ -1,41 +0,0 @@
> > > > -Bindings for Synopsys DesignWare I3C master block
> > > > -=================================================
> > > > -
> > > > -Required properties:
> > > > ---------------------
> > > > -- compatible: shall be "snps,dw-i3c-master-1.00a"
> > > > -- clocks: shall reference the core_clk
> > > > -- interrupts: the interrupt line connected to this I3C master
> > > > -- reg: Offset and length of I3C master registers
> > > > -
> > > > -Mandatory properties defined by the generic binding (see
> > > > -Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
> > > > -
> > > > -- #address-cells: shall be set to 3
> > > > -- #size-cells: shall be set to 0
> > > > -
> > > > -Optional properties defined by the generic binding (see
> > > > -Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
> > > > -
> > > > -- i2c-scl-hz
> > > > -- i3c-scl-hz
> > > > -
> > > > -I3C device connected on the bus follow the generic description (see
> > > > -Documentation/devicetree/bindings/i3c/i3c.yaml for more details).
> > > > -
> > > > -Example:
> > > > -
> > > > -       i3c-master@2000 {
> > > > -               compatible = "snps,dw-i3c-master-1.00a";
> > > > -               #address-cells = <3>;
> > > > -               #size-cells = <0>;
> > > > -               reg = <0x02000 0x1000>;
> > > > -               interrupts = <0>;
> > > > -               clocks = <&i3cclk>;
> > > > -
> > > > -               eeprom@57{
> > > > -                       compatible = "atmel,24c01";
> > > > -                       reg = <0x57 0x0 0x10>;
> > > > -                       pagesize = <0x8>;
> > > > -               };
> > > > -       };
> > > > diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > > > new file mode 100644
> > > > index 000000000000..5b8b43e6f1e4
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > > > @@ -0,0 +1,52 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/i3c/snps,dw-i3c-master.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Synopsys DesignWare I3C master block
> > > > +
> > > > +maintainers:
> > > > +  - Vitor Soares <vitor.soares@synopsys.com>
> > > 
> > > And it bounces. Someone else want it?
> > > 
> > 
> > Probably no one but me.
> 
> Can you change it to yourself when applying?
> 

Done!


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
