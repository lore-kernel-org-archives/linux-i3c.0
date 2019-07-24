Return-Path: <SRS0=9qBp=VW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C64C7618B
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Jul 2019 07:02:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C271620657
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Jul 2019 07:02:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ez8x9XFL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C271620657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkn5Q01ISa4Y7CQ2/PhnQVt6H1xSx8P56MJ1URMS/mo=; b=ez8x9XFLjDhczv
	mTVOBIDr/+ghqFEDrl/tkJOSD427Jte2PFIbZvE5AP3IDWpeIpKjfVJLZ5/mTK+np12BF6s2LqF7I
	o0IHy9bAa+rlHrY23nQ4CECIeypdCnEJkewiINGwcxJjMlCxXOKmZzGjengenJqKr0kp2SPE2zZl7
	zXrt7Z0HjX+UCigARuTbtvGn6Iscg2P1OIU70uE734k9rJeJ33pX8x0o+6d9/Y8ZDWhna6g82Gvog
	Txa0/ANMflshAoG4AhomWFM8jJK2myYL1ltaeMfX6SWj8BVMUe0VTTRzPJ2EeCT+ULmn9NibOa+wO
	86T2NQW1gKga/yENFedw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqXlM-0002tW-33; Thu, 25 Jul 2019 07:02:04 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqNlJ-0003lb-9p; Wed, 24 Jul 2019 20:21:22 +0000
Received: by mail-io1-f66.google.com with SMTP id k20so92320159ios.10;
 Wed, 24 Jul 2019 13:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RJ9nHyNd7LCl6+mSB0G4S2X04kojrU0TsARgzmq3agw=;
 b=T4wyi7c8R/Bzq/TwZu4LQOAObp8rXxpSoHfIqS+kQfjcHQVgE4PpHrwCSOiwD1YoVn
 a8FEju98fGD1rQ5BHbLzeTEuMJ7soHxDEaSx1vFglUwqcksDQDZKJGSkXLfjArMh0Nnt
 6lWPUBcpuD9gccpulJqUAxaHT4nYAK3GVOy7+KapPO2DR41ZvbomznNqdXAbm5JGMoLX
 +EDpt02FySjMUi3PtOFY/+VelLF6YWmIUpKKVAwSf6oBRLAL8EfzTsug2UiUuJ0VUaZf
 nXek6tQ4ch21p9VkBylCtQviMgN32NhrWgtoNZ3R8fcWhKOrmKUstqjY9oFgTBgu+SLT
 ChCQ==
X-Gm-Message-State: APjAAAUqdlb/tWx6JhawJx1qLDyCHq1FMrcj85vYoMun8HAyLBTzB2cS
 /wjiw5b9bIbeh0NewyKwwA==
X-Google-Smtp-Source: APXvYqwprV5ylAQXl6gUtT7NZHmcnqBWl3IgOcCq5QcBmtI4uojyhvDVa9K+DeOobOHPeGdMYTW9+Q==
X-Received: by 2002:a5e:8a46:: with SMTP id o6mr45348991iom.36.1563999680305; 
 Wed, 24 Jul 2019 13:21:20 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id r24sm34281026ioc.76.2019.07.24.13.21.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 13:21:19 -0700 (PDT)
Date: Wed, 24 Jul 2019 14:21:19 -0600
From: Rob Herring <robh@kernel.org>
To: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Document MediaTek I3C master
 bindings
Message-ID: <20190724202119.GA26566@bogus>
References: <1562677762-24067-1-git-send-email-qii.wang@mediatek.com>
 <1562677762-24067-2-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562677762-24067-2-git-send-email-qii.wang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190724_132121_344835_EC3037CB 
X-CRM114-Status: GOOD (  15.15  )
X-Mailman-Approved-At: Thu, 25 Jul 2019 00:02:02 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, bbrezillon@kernel.org, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, liguo.zhang@mediatek.com,
 linux-mediatek@lists.infradead.org, xinping.qian@mediatek.com,
 matthias.bgg@gmail.com, linux-i3c@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Jul 09, 2019 at 09:09:21PM +0800, Qii Wang wrote:
> Document MediaTek I3C master DT bindings.
> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>  .../devicetree/bindings/i3c/mtk,i3c-master.txt     |   48 ++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> 
> diff --git a/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt b/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> new file mode 100644
> index 0000000..d32eda6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> @@ -0,0 +1,48 @@
> +Bindings for MediaTek I3C master block
> +=====================================
> +
> +Required properties:
> +--------------------
> +- compatible: shall be "mediatek,i3c-master"

Needs to be SoC specific.

> +- reg: physical base address of the controller and apdma base, length of
> +  memory mapped region.
> +- reg-names: shall be "main" for master controller and "dma" for apdma.
> +- interrupts: the interrupt line connected to this I3C master.
> +- clocks: shall reference the i3c and apdma clocks.
> +- clock-names: shall include "main" and "dma".
> +
> +Mandatory properties defined by the generic binding (see
> +Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> +
> +- #address-cells: shall be set to 3
> +- #size-cells: shall be set to 0
> +
> +Optional properties defined by the generic binding (see
> +Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> +
> +- i2c-scl-hz
> +- i3c-scl-hz
> +
> +I3C device connected on the bus follow the generic description (see
> +Documentation/devicetree/bindings/i3c/i3c.txt for more details).
> +
> +Example:
> +
> +	i3c0: i3c@1100d000 {
> +		compatible = "mediatek,i3c-master";
> +		reg = <0x1100d000 0x1000>,
> +		      <0x11000300 0x80>;
> +		reg-names = "main", "dma";
> +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&infracfg CLK_INFRA_I3C0>,
> +			 <&infracfg CLK_INFRA_AP_DMA>;
> +		clock-names = "main", "dma";
> +		#address-cells = <3>;
> +		#size-cells = <0>;
> +		i2c-scl-hz = <100000>;
> +
> +		nunchuk: nunchuk@52 {
> +			compatible = "nintendo,nunchuk";
> +			reg = <0x52 0x0 0x10>;
> +		};
> +	};
> -- 
> 1.7.9.5
> 

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
