Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739BCC433EF
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Apr 2022 19:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z6tKFvkw7jODcrvewZfFEi8pXBRsAO1Eo8fIWGAWNs4=; b=afDaFq883i2JqI
	dA27Z5XMfYBa4H0fUuXJBHdCu/NaZeZ1iEVSliv5tNKy7dnmU2+B8gglAF14RsLuAt2vHLufBAGZt
	pbX4xshJD20SW/6mBvCsp0hRBLMQlMcIrDvQrVeqqTnh8qxN6KZ5hZIKMPxcmg0tp91WRqjD2Lk6S
	2hIzAcfsWPeEgkxUX7aVtpnDivOrJgNnHnff+LmWa1J55zY4VwzL8gGwWtp3sQfBzljljbEN7DLRB
	AzghdNWSklGk+Ym7W95riINNESD9cbPgxXLcwaU3tPaYUrAZ3rSudEk9BTCHruAa+uOOAd5e6U9Mv
	rBbefsO6djFvpetlyKTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhyxq-0028gF-S8; Fri, 22 Apr 2022 19:29:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhyxn-0028fq-VV
 for linux-i3c@lists.infradead.org; Fri, 22 Apr 2022 19:29:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AED8F61D46
 for <linux-i3c@lists.infradead.org>; Fri, 22 Apr 2022 19:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB41C385A9
 for <linux-i3c@lists.infradead.org>; Fri, 22 Apr 2022 19:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650655746;
 bh=Q2oAR+pSfdpnOBCupA59IimF354aWuPdLpUkV0r+X1A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZvjM2zXZNGfKDW8ftXFFNoXIwEvm5WhFhLPcuq0WeOn/Wc5VbY7BejIgkSjw0cXFB
 L18uYBL10WbBPVTaC4xEkDzTFqHVtlo+EDNUEaZGheXDoWYQqtosgvej0l0HaZW0Xf
 74yCeEqFG9ntlORINJHnA0nrWgH3J18Yz9DdPQR4cjEtJEJydNOo7ukDGZudtE5Cwz
 rz4y8O7cDWaB1la6qX5Pu1e3QcfLEZL9VyHcvSj1n1CNXxTo6Oyw7F7RvJ6jDH1Axz
 sbefZf/fdN1/HKcjs3CpdYvJL8EK8sLNVaFv4G02+L1+RAzwQmJ/cUUGTDPQq0Se58
 iLEFj1sk11ung==
Received: by mail-pg1-f180.google.com with SMTP id t13so8088646pgn.8
 for <linux-i3c@lists.infradead.org>; Fri, 22 Apr 2022 12:29:06 -0700 (PDT)
X-Gm-Message-State: AOAM5311kE321H9Q6wii1SbIyrFIRTGSWYdAnSPm+WFUHIKPsUt3ad2E
 ghTNI0EzODM47MvwQHTk/J7/0BXEAbzxo6maYQ==
X-Google-Smtp-Source: ABdhPJx2H3o/WsbUI+/ohovExKxoIZvN4GlgB9qk/tHaMKzI7NBb/FMjxKMgczTCxdm77K8O6FLeLWIUwvQFjbz5U0M=
X-Received: by 2002:aa7:8893:0:b0:4fb:10e1:8976 with SMTP id
 z19-20020aa78893000000b004fb10e18976mr6457659pfe.36.1650655745568; Fri, 22
 Apr 2022 12:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220422192236.2594577-1-robh@kernel.org>
In-Reply-To: <20220422192236.2594577-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 22 Apr 2022 14:28:53 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+t5e-Dr0z9Zd_+jaqwb1afEVx4SdjbQZA4bHpWf8a2jg@mail.gmail.com>
Message-ID: <CAL_Jsq+t5e-Dr0z9Zd_+jaqwb1afEVx4SdjbQZA4bHpWf8a2jg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i3c: Convert snps, dw-i3c-master to DT schema
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_122908_128704_0EB9C700 
X-CRM114-Status: GOOD (  19.35  )
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

On Fri, Apr 22, 2022 at 2:22 PM Rob Herring <robh@kernel.org> wrote:
>
> Convert the Synopsys Designware I3C master to DT schema format.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/i3c/snps,dw-i3c-master.txt       | 41 ---------------
>  .../bindings/i3c/snps,dw-i3c-master.yaml      | 52 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
>  create mode 100644 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
>
> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> deleted file mode 100644
> index 07f35f36085d..000000000000
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -Bindings for Synopsys DesignWare I3C master block
> -=================================================
> -
> -Required properties:
> ---------------------
> -- compatible: shall be "snps,dw-i3c-master-1.00a"
> -- clocks: shall reference the core_clk
> -- interrupts: the interrupt line connected to this I3C master
> -- reg: Offset and length of I3C master registers
> -
> -Mandatory properties defined by the generic binding (see
> -Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
> -
> -- #address-cells: shall be set to 3
> -- #size-cells: shall be set to 0
> -
> -Optional properties defined by the generic binding (see
> -Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
> -
> -- i2c-scl-hz
> -- i3c-scl-hz
> -
> -I3C device connected on the bus follow the generic description (see
> -Documentation/devicetree/bindings/i3c/i3c.yaml for more details).
> -
> -Example:
> -
> -       i3c-master@2000 {
> -               compatible = "snps,dw-i3c-master-1.00a";
> -               #address-cells = <3>;
> -               #size-cells = <0>;
> -               reg = <0x02000 0x1000>;
> -               interrupts = <0>;
> -               clocks = <&i3cclk>;
> -
> -               eeprom@57{
> -                       compatible = "atmel,24c01";
> -                       reg = <0x57 0x0 0x10>;
> -                       pagesize = <0x8>;
> -               };
> -       };
> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> new file mode 100644
> index 000000000000..5b8b43e6f1e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/snps,dw-i3c-master.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare I3C master block
> +
> +maintainers:
> +  - Vitor Soares <vitor.soares@synopsys.com>

And it bounces. Someone else want it?

Rob

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
