Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6511CA1017
	for <linux-i3c@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zqa314U9ZYQ4hZy5Vy8zHmsocZ8X+BP3WgKo+WmQmNU=; b=4/q0/i/GclTdDz
	onTKfgL6pUkbSJM7E6fIHnAb7YjgxddBGbJxxYsuz7WhI6u4z+ABVtrRVqwFezCrt1wlPw8R43QsH
	QzQ72FcqHz6X6EgRutun0RFThvZkxik3SO77bqkKNj6p7sFkugb2U19TsvFqaFk2yjslUloIoIKJq
	b5dI4gGLVExq8744C9pWvsx0IbF34cYKgY9X0iPQ13p0n4EG6DtKCv5sXE2KOwji8Hkf2uwYRz4Ub
	u99RwyJMTdySXpbWtK1fdrhG0RwPGXIWjD7GrPe01EoKhNRhv55JGLVJ5NyR9sj6Gtv/clYyF2COd
	3ztNGHf/MGrA9jlnRuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzQx-00000008Ezm-2ZMs;
	Thu, 04 Sep 2025 02:10:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utuOK-00000007bGL-3JeY
	for linux-i3c@lists.infradead.org;
	Wed, 03 Sep 2025 20:47:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A721402D7;
	Wed,  3 Sep 2025 20:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F28C4CEE7;
	Wed,  3 Sep 2025 20:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756932460;
	bh=fmmefG9viijRhTVNQthic+Hu8WGTQ6x3xU0/JdzSOjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVrMb9ZVNzZejicKw11SwSxH3otxG3KBAreea14rAz36ny2rEHcNl7rGQcic+LFYt
	 iOuXWzfsOLHxgZMfKi2vN/TMl8agBwyhCXYDdEIwzpIoYk0gCFLvJFMLL4j/ZJkqgw
	 DKZKPNnv8BjZXgEWcTDudeAqeXUiWRoKVF+CSWkotf+byb0UvtV7G4lBoL5u3e7vLr
	 njz4cOVmWMlCx94tu086RPh5z1Gs3uZw1V99FJfJ6fLtnOhIVEYVBBTOVzQm1MoY1Z
	 Z52sAjAau7oW7q3+CTm/6KEfi16kSGFUOpF01dhS93kv1LVqG4OwzT7JV21AhQ+Jju
	 6TqHkMmey6kqg==
Date: Wed, 3 Sep 2025 15:47:38 -0500
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
Subject: Re: [PATCH V3 1/2] dt-bindings: i3c: Add AMD I3C master controller
 support
Message-ID: <20250903204738.GA2744698-robh@kernel.org>
References: <20250903095906.3260804-1-manikanta.guntupalli@amd.com>
 <20250903095906.3260804-2-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250903095906.3260804-2-manikanta.guntupalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_134740_848560_4F6CC6BE 
X-CRM114-Status: GOOD (  16.97  )
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

On Wed, Sep 03, 2025 at 03:29:05PM +0530, Manikanta Guntupalli wrote:
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
> ---
>  .../devicetree/bindings/i3c/xlnx,axi-i3c.yaml | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
> new file mode 100644
> index 000000000000..32f73c31121e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
> @@ -0,0 +1,53 @@
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
> +properties:
> +  compatible:
> +    const: xlnx,axi-i3c-1.0

Where does the version number come from? This must correspond to some 
h/w documentation or it is useless.

Rob

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
