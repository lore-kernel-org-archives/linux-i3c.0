Return-Path: <SRS0=eOHn=JE=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C9EC433B4
	for <linux-i3c@archiver.kernel.org>; Wed,  7 Apr 2021 11:34:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E7A46113B
	for <linux-i3c@archiver.kernel.org>; Wed,  7 Apr 2021 11:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E7A46113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EJAbyfjBMRmEOLPDxkcuP+m4LB3pL06DVBs0asyBNkw=; b=oTP6cZZm8cf4h7OLKe1Hp82CF
	fE8r12FICQrgU3zVTq8QjZHQhy2E47flDXr8759JjAaslg5VsnttWMnuyOA2BwiM/atSX3qsWR2b3
	DnedpYGX5MEXWN+HDdHNwxN3RAcuEyBXX6Xudj3VaR3TE93XY25rofTrh9FcIaiNm/A7MAJ5BSKje
	v536EiUiDA4TQwmzqEXKJF3YBVCfExO+RhldSxDiF1KDxGEQW9EZIvhKdX4QQ91nXqFe6x0SZ+b6H
	7U8geCJ1xFmXtgVj5d1gpnNCE7Wlc668pdJ0JzpZdSS+exXeaz3wkCbhuw+SV63wDmBZjoFWZH98V
	NaBKauRiA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU6S7-004tH2-Rx; Wed, 07 Apr 2021 11:34:31 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU6S1-004tGJ-KF
 for linux-i3c@lists.infradead.org; Wed, 07 Apr 2021 11:34:28 +0000
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr
 [90.65.108.55]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id F204D2000A;
 Wed,  7 Apr 2021 11:34:20 +0000 (UTC)
Date: Wed, 7 Apr 2021 13:34:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Vitor Soares <vitor.soares@synopsys.com>,
 devicetree@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 09/19] dt-bindings: i3c: update i3c.yaml references
Message-ID: <YG2YvD2WABchrVAA@piout.net>
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
 <8bb8923b4d98b4e8a6336a4c0b548c714e01aef5.1617783062.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8bb8923b4d98b4e8a6336a4c0b548c714e01aef5.1617783062.git.mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_123426_117991_A77DB8A3 
X-CRM114-Status: GOOD (  15.88  )
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

On 07/04/2021 10:20:48+0200, Mauro Carvalho Chehab wrote:
> Changeset 5e4cdca887fd ("dt-bindings: i3c: Convert the bus description to yaml")
> renamed: Documentation/devicetree/bindings/i3c/i3c.txt
> to: Documentation/devicetree/bindings/i3c/i3c.yaml.
> 
> Update the cross-references accordingly.
> 
> Fixes: 5e4cdca887fd ("dt-bindings: i3c: Convert the bus description to yaml")
> Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt   | 6 +++---
>  .../devicetree/bindings/i3c/snps,dw-i3c-master.txt          | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
> index 1cf6182f888c..3716589d6999 100644
> --- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
> +++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
> @@ -10,19 +10,19 @@ Required properties:
>  - reg: I3C master registers
>  
>  Mandatory properties defined by the generic binding (see
> -Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> +Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
>  
>  - #address-cells: shall be set to 1
>  - #size-cells: shall be set to 0
>  
>  Optional properties defined by the generic binding (see
> -Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> +Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
>  
>  - i2c-scl-hz
>  - i3c-scl-hz
>  
>  I3C device connected on the bus follow the generic description (see
> -Documentation/devicetree/bindings/i3c/i3c.txt for more details).
> +Documentation/devicetree/bindings/i3c/i3c.yaml for more details).
>  
>  Example:
>  
> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> index 5020eb71eb8d..07f35f36085d 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> @@ -9,19 +9,19 @@ Required properties:
>  - reg: Offset and length of I3C master registers
>  
>  Mandatory properties defined by the generic binding (see
> -Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> +Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
>  
>  - #address-cells: shall be set to 3
>  - #size-cells: shall be set to 0
>  
>  Optional properties defined by the generic binding (see
> -Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> +Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
>  
>  - i2c-scl-hz
>  - i3c-scl-hz
>  
>  I3C device connected on the bus follow the generic description (see
> -Documentation/devicetree/bindings/i3c/i3c.txt for more details).
> +Documentation/devicetree/bindings/i3c/i3c.yaml for more details).
>  
>  Example:
>  
> -- 
> 2.30.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
