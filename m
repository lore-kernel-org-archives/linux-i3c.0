Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30365CA1017
	for <linux-i3c@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzuQjRJRwXsoLq+Dk99qWS7xwajBqD6Cclg/JRUo03E=; b=A1V4I5BbPQGy4I
	+BtRmdG9HQ3gLUDGOQH550OV2zbqrxcEIPaajPTwgFL2mU4Hypp0B9Vomx0sDsKhygAWdTTaOC2+S
	8Ll9ETiqaZzkTPkC9yRHBWbveI6q7MBsB4V7t+Y3B9k9+JxoQcuBXvjxh9OKUT4oiSualHaGgKNCD
	CdFTtB+W8PvU6IgAUG3K9/gZofw/ue7/+lFsPRi44bp57DY9K7IrFuR+L3nH7+iYm6krNeUDFfzc5
	2VqEkiA2e4SYGXOL45diNIQAahFSh7KK48BaEE6LrwWjaKeItyA1GIt0L6TH5cCAiQyzDi78zqlZt
	fYlVRVABApqeGpNqUf5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZi-00000005Yuw-3UgC;
	Sat, 06 Sep 2025 00:14:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uug2q-00000005JhN-0LG7
	for linux-i3c@lists.infradead.org;
	Fri, 05 Sep 2025 23:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23DC6601AE;
	Fri,  5 Sep 2025 23:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2962C4CEF1;
	Fri,  5 Sep 2025 23:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757115638;
	bh=vxYzG+tFLchZIj9rrVbtGxvJOup9VkxSvC/g/VUhtwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jzHfgPr8OJpeMDxSoZMMpg9Mc3C/PaBn+3rO4JAV0xviSHIoBnv97jHdnenX85p3x
	 D3wdwaX1vEvoptJw2RYW6NObvWJBVxgcbA9DiJGZKUAVIPUZc4JaJjENtfLtp8lnAh
	 UPOtGI2DnYD5oGE+MEB3afuk3wC+MEPiQ6TOnpo2ilFKUneWalFtDx+XLGYlDtCV0b
	 WY3+/pIUO2UXzGIOh+QkWSOpt/FclzWtyvasmox5chvwJXHK7fCJDETQjBreMHLack
	 c27Vb7kbA28oVJZevQGW/dRQ4KUZ589jo7aTMAlJsMqnCF9CKvQBaNoPFDffPLnZb3
	 5b7zQUhNDpOOQ==
Date: Fri, 5 Sep 2025 18:40:37 -0500
From: Rob Herring <robh@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, michal.simek@amd.com, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	kees@kernel.org, gustavoars@kernel.org,
	jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, radhey.shyam.pandey@amd.com,
	srinivas.goud@amd.com, shubhrajyoti.datta@amd.com,
	manion05gk@gmail.com
Subject: Re: [PATCH V4 1/2] dt-bindings: i3c: Add AMD I3C master controller
 support
Message-ID: <20250905234037.GA1512025-robh@kernel.org>
References: <20250905113740.3841181-1-manikanta.guntupalli@amd.com>
 <20250905113740.3841181-2-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250905113740.3841181-2-manikanta.guntupalli@amd.com>
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

On Fri, Sep 05, 2025 at 05:07:39PM +0530, Manikanta Guntupalli wrote:
> Add device tree binding documentation for the AMD I3C master controller.
> 
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> ---
> Changes for V2:
> Updated commit subject and description.
> Moved allOf to after required.
> Removed xlnx,num-targets property.
> 
> Changes for V3:
> Updated commit description.
> Corrected the order of properties and removed resets property.
> Added compatible to required list.
> Added interrupts to example.
> 
> Changes for V4:
> Added h/w documentation details.
> ---
>  .../devicetree/bindings/i3c/xlnx,axi-i3c.yaml | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
> new file mode 100644
> index 000000000000..1daeb20205ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/xlnx,axi-i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMD I3C master
> +
> +maintainers:
> +  - Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> +
> +description:
> +  The AXI-I3C IP is an I3C Controller with an AXI4-Lite interface, compatible
> +  with the MIPI I3C Specification v1.1.1. The design includes bidirectional I/O
> +  buffers that implement open collector drivers for the SDA and SCL signals.
> +  External pull-up resistors are required to properly hold the bus at a Logic-1
> +  level when the drivers are released.
> +
> +  For more details, please see https://docs.amd.com/r/en-US/pg439-axi-i3c
> +
> +properties:
> +  compatible:
> +    const: xlnx,axi-i3c-1.0

I'm still wondering where 1.0 comes from? From the link the only 
versions I could see are Vivado tool versions which appear to be year 
based. If the IP is bundled with the tool, then use the tool version 
(oldest version you tested with) if there is no other versioning. A 1.0 
version really just sounds like you made it up.

Something like bindings/sifive/sifive,blocks-ip-versioning.yaml is what 
I'm looking for.

Rob

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
