Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAAFC433FE
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Apr 2022 19:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/M6Kf+YDpSHq0taSsTCn9UsenDguLZOTNVfGK5rUYU=; b=WC27aCiTkx4kh6
	oXKjulXHmChgqggJ1lPLvAVZes7OJiOvsQ8hakzwhG9+h2FvkRKAouQcXHY1v3rTvMFZ/2WQ7Itir
	kRPLtMQ7vdXX/iA24A9pWkdzi7TATcpdVdKVqeWdnWgvW6UKhLdeLXr1MPvYJZHdVyGFOK0sdpcQz
	qFGf5x5NtL5itM6S25uCx5M4wtyBTzU3m507JTqdvHOjZBhkaoNrzZhf2ljtPVwuvkPxxV8uk9zAA
	HpOaqB5UAmWPX2VfKqDRC90GDeolSx3oZiY1YDGnTeKqHE3AchhTw/NR0CHJEi5h4W40otSNdFJYV
	Ea/CsnJZ4C2TH5gSFWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj4gO-00B77S-3S; Mon, 25 Apr 2022 19:47:40 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj4gL-00B75o-Ex
 for linux-i3c@lists.infradead.org; Mon, 25 Apr 2022 19:47:39 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 i11-20020a9d4a8b000000b005cda3b9754aso11509869otf.12
 for <linux-i3c@lists.infradead.org>; Mon, 25 Apr 2022 12:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1BawjqkBLHRmejvmDxzJLVGY9D9hx57rjotxcPxJnyk=;
 b=cXVWSG2MhO40SDLVmINTKQm72qWv3kmZRflLkGRfkYD6i+xmELyvtx55cDAnn9G/Xb
 1sWxSFXWfF5T/UZ4wiZ3ln/CfxFrQC8VW2wJALgxpoDYnokpnPoo7Em0j6y4oPsyApoV
 bmvh0nJNEbQ8n5b7xJeAEPgxs4yIG/3NHjiRxwUvQi9ga1yd6dUQsCXdvPms+34W8iZD
 1wsMf73X4sCh5PUY12qRvMzbYFiumw35OlZXsd0b7EMQHQcZkzl/mFtICe5Pkyfp6N8X
 3d8K6fvQbr6GW32ptVcoemDdmTDvWGl60mgvs0ML4f+dZKoTvVhUWmQcJlA4CU8WlEDc
 en2g==
X-Gm-Message-State: AOAM532KlBOg8aAx6D2Bh5TQdpVmTjqj0tk6crWm84JugpZLodtFUJTx
 CZlTbQSbLbZByh9emRX2Fw==
X-Google-Smtp-Source: ABdhPJxUVOseF982okz0I94zQl56iy4xw06HftnN6UG796Lf0dWh37WBfSBkWydezRL2R0TwJ+xhxQ==
X-Received: by 2002:a9d:bc2:0:b0:605:c65f:96c2 with SMTP id
 60-20020a9d0bc2000000b00605c65f96c2mr900036oth.319.1650916055360; 
 Mon, 25 Apr 2022 12:47:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s10-20020a056830148a00b005ea12d6454bsm2769826otq.38.2022.04.25.12.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 12:47:34 -0700 (PDT)
Received: (nullmailer pid 147316 invoked by uid 1000);
 Mon, 25 Apr 2022 19:47:33 -0000
Date: Mon, 25 Apr 2022 14:47:33 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: i3c: Convert snps, dw-i3c-master to DT schema
Message-ID: <Ymb61YHl62AfSe2R@robh.at.kernel.org>
References: <20220422192236.2594577-1-robh@kernel.org>
 <CAL_Jsq+t5e-Dr0z9Zd_+jaqwb1afEVx4SdjbQZA4bHpWf8a2jg@mail.gmail.com>
 <YmMD3RPXfPdiYXyg@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YmMD3RPXfPdiYXyg@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_124737_542337_944C46EF 
X-CRM114-Status: GOOD (  21.09  )
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

On Fri, Apr 22, 2022 at 09:37:01PM +0200, Alexandre Belloni wrote:
> On 22/04/2022 14:28:53-0500, Rob Herring wrote:
> > On Fri, Apr 22, 2022 at 2:22 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > Convert the Synopsys Designware I3C master to DT schema format.
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  .../bindings/i3c/snps,dw-i3c-master.txt       | 41 ---------------
> > >  .../bindings/i3c/snps,dw-i3c-master.yaml      | 52 +++++++++++++++++++
> > >  2 files changed, 52 insertions(+), 41 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> > >  create mode 100644 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> > > deleted file mode 100644
> > > index 07f35f36085d..000000000000
> > > --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> > > +++ /dev/null
> > > @@ -1,41 +0,0 @@
> > > -Bindings for Synopsys DesignWare I3C master block
> > > -=================================================
> > > -
> > > -Required properties:
> > > ---------------------
> > > -- compatible: shall be "snps,dw-i3c-master-1.00a"
> > > -- clocks: shall reference the core_clk
> > > -- interrupts: the interrupt line connected to this I3C master
> > > -- reg: Offset and length of I3C master registers
> > > -
> > > -Mandatory properties defined by the generic binding (see
> > > -Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
> > > -
> > > -- #address-cells: shall be set to 3
> > > -- #size-cells: shall be set to 0
> > > -
> > > -Optional properties defined by the generic binding (see
> > > -Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
> > > -
> > > -- i2c-scl-hz
> > > -- i3c-scl-hz
> > > -
> > > -I3C device connected on the bus follow the generic description (see
> > > -Documentation/devicetree/bindings/i3c/i3c.yaml for more details).
> > > -
> > > -Example:
> > > -
> > > -       i3c-master@2000 {
> > > -               compatible = "snps,dw-i3c-master-1.00a";
> > > -               #address-cells = <3>;
> > > -               #size-cells = <0>;
> > > -               reg = <0x02000 0x1000>;
> > > -               interrupts = <0>;
> > > -               clocks = <&i3cclk>;
> > > -
> > > -               eeprom@57{
> > > -                       compatible = "atmel,24c01";
> > > -                       reg = <0x57 0x0 0x10>;
> > > -                       pagesize = <0x8>;
> > > -               };
> > > -       };
> > > diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > > new file mode 100644
> > > index 000000000000..5b8b43e6f1e4
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > > @@ -0,0 +1,52 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/i3c/snps,dw-i3c-master.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Synopsys DesignWare I3C master block
> > > +
> > > +maintainers:
> > > +  - Vitor Soares <vitor.soares@synopsys.com>
> > 
> > And it bounces. Someone else want it?
> > 
> 
> Probably no one but me.

Can you change it to yourself when applying?

Rob

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
