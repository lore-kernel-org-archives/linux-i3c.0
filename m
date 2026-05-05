Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F748CD3427
	for <linux-i3c@archiver.kernel.org>; Tue,  5 May 2026 18:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y43sJyw3a88g3J+Of4cJAO98Zws4EWFGzPj5IyjcNSk=; b=hK0dE/vZ77a4vC
	7B1vtXSGTNxAge7/tP56nHYKpfsVkrKIWzMYrUZphHFZo1yUIo8CBUj84Thh2tVdtwIl2qDbyGky3
	Y4KDtM3DZxVPO92CM8xt7q8xR/Jp6UnLHvFmW2l4ggaGAwpmWc37TVyKGZpC2KsDLQHeWFNvbLB7E
	UoK1oA3p16oNRCusk7rE+0au+Kai9uwBFjO5Q2iAWhIb+kL4L7ZTdHXdams6/pWZ6GfQJrbxaSYFe
	80MqkBojcxO6YeFiiA1OeGiaHkQNfiK7FfMpIUlBIKGDiJjuv62dZ5zuQv85H5ddGaUlYaoYYe4x6
	VRiEspOWyvVXsTz2B63Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKIU-0000000H8j7-3d2C;
	Tue, 05 May 2026 18:15:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKIT-0000000H8iq-2FwR
	for linux-i3c@lists.infradead.org;
	Tue, 05 May 2026 18:15:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B6E960181;
	Tue,  5 May 2026 18:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18336C2BCB4;
	Tue,  5 May 2026 18:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778004904;
	bh=mY5ckSV/U4sQODz+6cDbl4DnNfzjCu+HvxWVlVn51ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1/Iw8o28oFmNbhUneu2Pq/ro2uvC89gzU0vmOpXZ5yLKP9Hu/6CS+lFot6eB0Y0n
	 EJH1YOxNGdYDsk3ARDh1IjKFshwJxe+V9Pqd7569pD+qKizUqkJbp6T4yWw2ER0xdQ
	 YAp1EaY9ezzBFwy09B7HDjVXwIll0CDYxz6UpNj1ivYr/IGUuqeyZKTxKnPNNrFe+u
	 y9mElQfw76iWuu0u6D6m1zDfNc8jr3hNImEJ1Po+5DseMoywBSo9aekS9KexBpTw2k
	 NGMCV7jRA7tY9uQaWoqUPqvitBt4U6Ns24Wj6si6Ozz0ltilsZWbn8PIvyvf+jVYN+
	 vsTRqMVTbRRgg==
Date: Tue, 5 May 2026 13:15:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: aman.kumarpandey@nxp.com, lee@kernel.org, broonie@kernel.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	vikash.bansal@nxp.com, linux-i3c@lists.infradead.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
	Frank.Li@nxp.com, priyanka.jain@nxp.com
Subject: Re: [PATCH v9 3/7] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <177800490174.3674177.12021771110967093852.robh@kernel.org>
References: <20260420105222.1562243-1-lakshay.piplani@nxp.com>
 <20260420105222.1562243-4-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260420105222.1562243-4-lakshay.piplani@nxp.com>
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


On Mon, 20 Apr 2026 16:22:18 +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> 
> Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> multiport I3C hub family. These devices connect to a host via
> I3C/I2C/SMBus and allow communication with multiple downstream
> peripherals.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> 
> ---
> Changes in v9:
>  - Referenced i3c.yaml and i2c-controller.yaml for child nodes
>  - Dropped unnecessary #address-cells and #size-cells from child nodes
> 
> Changes in v8:
>  - Add compatible in i3c example
> 
> Changes in v7:
>  - Fix schema validation issues
>  - Adjust required properties
>  - Add I2C example
> 
> Changes in v6:
>  - Use a vendor prefix for the attributes
> 
> Changes in v5:
>  - Removed SW properties: cp0-ldo-microvolt,cp1-ldo-microvolt,
>    tp0145-ldo-microvolt, tp2367-ldo-microvolt
>  - Changed supply entries and its descriptions
> 
> Changes in v4:
>  - Fixed DT binding check warning
>  - Removed SW properties: ibi-enable, local-dev, and always-enable
> 
> Changes in v3:
>  - Added MFD (Multi-Function Device) support for I3C hub and on-die regulator
>  - Added Regulator supply node
> 
> Changes in v2:
>  - Fixed DT binding check warning
>  - Revised logic for parsing DTS nodes
> ---
> ---
>  .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 291 ++++++++++++++++++
>  MAINTAINERS                                   |   9 +
>  2 files changed, 300 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
