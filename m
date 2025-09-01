Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D59CA0FF0
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Sep 2025 05:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWm+/Jlz0Isv0JWzGRNIBVFtaG0xZbNg8EyX56Q3gNA=; b=FQJRQ/Bfw32/Ox
	9v6yCJIEcv47YJI316FV89gZAp1/0vzO7OIRCQcf/RKRgYpIUFPXYEuQNrwhl8F3eCRpVwSZPVsqa
	28wW5KcToOc2LQUJH2U0vcLolMjNR8wL9oAbq+pkR6jD7oYX7Sqturn2hcbM0zmnkgatQE3qVs2vn
	ozqnwlqIV3K7JAOsBnfOIeA6wSgncuTpWIpMcIBgt/KpqPe4UHqRd1PDBkNOZaGX5Gdrz2Cq7PCjG
	M7kd43PaxIRNGxFAPwbjBr8vy6IGD2ZR8ode6K48maNPK5PmOUMv4aRMJ4zrIrkj8mszmJcD0ALGH
	KN7jR29XIUiM+c7mhSsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uswyb-0000000BCXA-0ed0;
	Mon, 01 Sep 2025 05:21:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uswyZ-0000000BCX3-3iuc
	for linux-i3c@lists.infradead.org;
	Mon, 01 Sep 2025 05:21:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0711C601B8;
	Mon,  1 Sep 2025 05:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC43C4CEF0;
	Mon,  1 Sep 2025 05:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756704066;
	bh=p73wikkWjgPiEXtKBYuxdsbxYw/1Fn1rox3FNuHjuNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJM61YiTet+yQE0KLUtqO/JBa3O54UgDiKgSc7JnNCikYZGRdGKkQzPVhVyXz9TBz
	 gCOgADD3DEnLu2NYiTpaUWA8uMnmKYtJP8N/KD/LFKawXWrk2O9iyhAe7g8dTD06qL
	 BlVw6kBmqeCg1FheP7czoC7LRDEsqa1YqZhFcuXVuB+Acce0j/VoIooRtXJjBsXEdV
	 QzEOmfROJJoA9UzMTvDmFrpML0c/YW25rDxkCrXcespvcamK9NBGSWGcrD+G5HEu7b
	 Kk1GAiLCMj0KMgJfu39kGSHjM7m8bjZIORvvr06cY05h6sD8lEZbwZFtFmEfRos08x
	 HA3FI3O/opGSg==
Date: Mon, 1 Sep 2025 07:21:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, michal.simek@amd.com, alexandre.belloni@bootlin.com, 
	Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kees@kernel.org, gustavoars@kernel.org, jarkko.nikula@linux.intel.com, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, radhey.shyam.pandey@amd.com, srinivas.goud@amd.com, 
	shubhrajyoti.datta@amd.com, manion05gk@gmail.com
Subject: Re: [PATCH V2 1/2] dt-bindings: i3c: Add AMD I3C master controller
 support
Message-ID: <20250901-hospitable-tentacled-chicken-05b2ac@kuoka>
References: <20250829171327.2590730-1-manikanta.guntupalli@amd.com>
 <20250829171327.2590730-2-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250829171327.2590730-2-manikanta.guntupalli@amd.com>
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

On Fri, Aug 29, 2025 at 10:43:26PM +0530, Manikanta Guntupalli wrote:
> Add device tree binding documentation for the AMD I3C master controller.
> 
> The controller is represented by the compatible string "xlnx,axi-i3c-1.0".
> The binding specifies required properties including register space, clock,
> resets, interrupts, and provides an example usage.
> 
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> ---
> Changes for V2:
> Updated commit subject and description.
> Moved allOf to after required.
> Removed xlnx,num-targets property.
> ---
>  .../devicetree/bindings/i3c/xlnx,axi-i3c.yaml | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
> new file mode 100644
> index 000000000000..48be3c53c1be
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
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1

Reg is the second property. Rest should go alphabetically.

> +
> +  clocks:
> +    maxItems: 1
> +
> +required:

By convention, also compatible.

> +  - reg
> +  - clocks
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i3c@80000000 {
> +        compatible = "xlnx,axi-i3c-1.0";
> +        reg = <0x80000000 0x10000>;
> +        clocks = <&zynqmp_clk 71>;

Make the example complete - missing resets and interrupts.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
