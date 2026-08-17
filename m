Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743B8C5B572
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Aug 2026 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qp41yzcHwBDVgTWBwJiw+Vj5i45IheayiyoSUncBO3o=; b=lrqhgSXIxm03vs
	w044JqVKUGTheGlpAHXoa1Up1oqPScN4rmbJpIUqU4HFcFDSl3YLmhvkfFDwZRsj8ieOc5Mg22tV+
	4jKeOb9xJA+dxe1gdjcWt2y3ObtaGO1czeAQRGPilb1aVigDH2/06i88ZPGWZ7NJPxXhCDrPCWjE5
	/Bi4imH6v5pIWZ7o2kVuNfLGA9oSvAabL2dhgk4n5EyTs9G7AkbDdS6u1sMyi6Br+3hfJ6QuVqGTT
	zGTZduh4Bm8YwQbyl0l+gVJgZUszminRtExBL2rVJP+FdRJudNNEPQfhUEYtR0WBL9knbWv6e50a6
	nN17/MbVe5RLglg0BLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvt3E-00000005jfa-0RpR;
	Mon, 17 Aug 2026 08:50:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvt3D-00000005jfO-1Mlz
	for linux-i3c@lists.infradead.org;
	Mon, 17 Aug 2026 08:50:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87E72601FB;
	Mon, 17 Aug 2026 08:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2671F000E9;
	Mon, 17 Aug 2026 08:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786956634;
	bh=3NVG/fnIH1hr1Z4451wftXcoqSh2NidV53lUO4APREQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UKHrevmAycsLJU+tXUxHIvC+VA72wNnduTmMJWHnxQ9pJVdRpUGh1j+BtWpTpE2LP
	 mMU8Z1PniO3m+TXpxaiIg+ulOQzYKbCIg7oUe8p0eBRVwyH+TWHU90BvwqgYOBh30d
	 4janILwibPAWnWDiiHW2qw9UOmenSVmbHtCLVpiwkHg3/cwoU9oSzTY7Ar74XFNKi5
	 gh/eM9Dy9opAbnhvT49NWoEa27q2dd9keR9dSRhmgWs+5mjSIOLQlSg2xg2j/3IckN
	 I/wS/umbSy85s21WeD9WMf+z2zVDXkEqd8hy/U7/H0L8oNRtYvknCX9EGcvLhnhCzF
	 D2OCJ+guHF94g==
Date: Mon, 17 Aug 2026 10:50:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <20260817-spry-attentive-hamster-ea3c0f@quoll>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
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

On Fri, Aug 14, 2026 at 05:21:53PM +0530, Shubham Patil wrote:
> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> IP. Describe them with two boolean properties.
> 
> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> capable design is always IBI capable as well. Both events are reported
> through the controller interrupt, which is therefore required whenever
> the capability is present.
> 
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---
>  .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>

So the same SoC using this core will have different synthesis options?
IOW, why isn't this implied by a specific compatible?

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
