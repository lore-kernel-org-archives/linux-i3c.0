Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A160C43602
	for <linux-i3c@archiver.kernel.org>; Tue, 30 Jun 2026 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2M8UqHNL2jxCpSUkd1sqJVbay8Ag8F0OwqOhrLl+vo=; b=FLfhic1Gapp96b
	v0wTj64+GkoocLgQJkFNuexrp8qgeihocacx6g2NSHQ1nSKPB7Uv1OZL+gvS2CFnBLYzjarCjiBrF
	7s6MmJ3eL6zM+Njsa3uoow79j4HToHTz2OlXCxw17NSQH+oBzQdaHkB9ZUMn/+v/wKWed40V6OgYX
	YZporrGXkR+ex83y0WeLDKzrx2Ps/UjjJu5I4fZ12VrYAAlofB3ZyVh3JzAHM1IFq9H7xCyXwXicD
	2iZc9BBZB2uE+wBIgpDbb/hEe2cGmTBkcdJepAj4T8rEiOa7Z0MSkavDOEdaPl5mNbIZy9RkXBekQ
	DvbiVYWbPMgAzPF2y7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1web79-0000000HS7T-0iDs;
	Tue, 30 Jun 2026 16:15:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1web77-0000000HS78-3KQa
	for linux-i3c@lists.infradead.org;
	Tue, 30 Jun 2026 16:15:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E556B601C7;
	Tue, 30 Jun 2026 16:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7359C1F000E9;
	Tue, 30 Jun 2026 16:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836108;
	bh=eb0sWdkKcVZuiKOIJ6FAW+I06k/4BEXqFcAMn2RFR64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TzoRfypqbyHyYC058os6xjzoo0pe/kS/QOQH02nFIqoXQhsi9obHZ/eurkAXX77r/
	 TGf6F7sl95t4bcLwI2dS9DburRMXdJ6ZnW0VjmesOruwSWIXEhSJX0USX4j/PtCLoR
	 k04vJGCUaRCwFfGQ6kUFPmlMxNfaYbvPhWrSu1NTuy2xFeZsUYxAlotm+yPIXBJbx8
	 Zk7A7wZtD+EH7DCLZE7Owkf678LTcUSvtc+vY8+KLX404Qi1c9/1qSFwbV9JRtjHha
	 chnvRadTMlmO/S/1hM02JYqktsTBI/E52jNgMQ1ZEsoE/woKA2wd0NFAsGOloeaNFt
	 kcJC3NxCEdOfA==
Date: Tue, 30 Jun 2026 11:15:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-tegra@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to
 support SETAASA
Message-ID: <178283610732.3797495.11836462917948472551.robh@kernel.org>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-2-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260624102153.1770072-2-akhilrajeev@nvidia.com>
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


On Wed, 24 Jun 2026 10:20:55 +0000, Akhil R wrote:
> Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
> Discovery and Configuration Specification [1] to specify which discovery
> method an I3C device supports during bus initialization. The property is
> a bitmap, where a bit value of 1 indicates support for that method, and 0
> indicates lack of support.
> 
> Bit 0: SETDASA CCC (Direct)
> Bit 1: SETAASA CCC (Broadcast)
> Bit 2: Other CCC (vendor / standards extension)
> All other bits are reserved.
> 
> It is specifically needed when an I3C device requires SETAASA for the
> address assignment. SETDASA will be supported by default if this property
> is absent, which means for now the property just serves as a flag to
> enable SETAASA, but keep the property as a bitmap to align with the
> specifications.
> 
> [1] https://www.mipi.org/mipi-disco-for-i3c-download
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  .../devicetree/bindings/i3c/i3c.yaml          | 36 ++++++++++++++++---
>  include/dt-bindings/i3c/i3c.h                 |  4 +++
>  2 files changed, 35 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
