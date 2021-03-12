Return-Path: <SRS0=ezBY=IK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFC2C433E0
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Mar 2021 07:24:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 408EE64F81
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Mar 2021 07:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 408EE64F81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FOdRqcIkxe2MKry1U9QcDtf4K9EsczfZCdZ01UBQsb4=; b=bmoODLHsTCVjmAvPX5RjqA7y0
	QHpCRfx++yijkKkIJPF5NjQw320/QpgETgOHUucWl7GDvMzMEejIDBrTs4I9H+9kcsxW0V5RhwwC0
	EAaxdlqSWWfrp2tk3LopwTYwyRje13XeBikdFnv/CCy9GeeyQPZj9Ss2uU3rRVS3ZSeGDP+jf5fcH
	kBeCuSbbyHk0Y1Cv559O6GVUzbBdJ70sC50YuP6tpGhYs4i8qqrQiwSbhrUma6h75K3F5ht9eOwRv
	LlqWbK2m8+cHTR3ChYjKsEfghFCr8mCIQejkhYsuZMmdGgT/uD55T6o+YDXUvwFoXD1u7Y8el2tBe
	fII/Vl37w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKc9j-00Amo0-Fz; Fri, 12 Mar 2021 07:24:19 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKc9e-00Amni-SO
 for linux-i3c@lists.infradead.org; Fri, 12 Mar 2021 07:24:17 +0000
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D9B9A200002;
 Fri, 12 Mar 2021 07:24:12 +0000 (UTC)
Date: Fri, 12 Mar 2021 08:24:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Culhane
 <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: i3c: Fix silvaco,i3c-master-v1 compatible
 string
Message-ID: <20210312082411.1435f9aa@xps13>
In-Reply-To: <20210311234056.1588751-1-robh@kernel.org>
References: <20210311234056.1588751-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_072415_357322_025807C0 
X-CRM114-Status: GOOD (  13.53  )
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


Rob Herring <robh@kernel.org> wrote on Thu, 11 Mar 2021 16:40:56 -0700:

> The example for the Silvaco I3C master doesn't match the schema's
> compatible string. Fix it.
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Conor Culhane <conor.culhane@silvaco.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-i3c@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> index adb5165505aa..62f3ca66274f 100644
> --- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> @@ -49,7 +49,7 @@ additionalProperties: true
>  examples:
>    - |
>      i3c-master@a0000000 {
> -        compatible = "silvaco,i3c-master";
> +        compatible = "silvaco,i3c-master-v1";
>          clocks = <&zynqmp_clk 71>, <&fclk>, <&sclk>;
>          clock-names = "pclk", "fast_clk", "slow_clk";
>          interrupt-parent = <&gic>;

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
