Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5FEC79FB7
	for <linux-i3c@archiver.kernel.org>; Thu, 10 Sep 2026 04:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IO+wJZE6YfL0LZBV8Dyye/mBRmyBggGZmP9NG38rGvA=; b=wSuDxL8KawBVtr
	oBO+uFnYB/ah1B7coU7uXWgGvTNAQQmmICQoyF4Wgv2mV6C2DUQG/kNMnFYYSM2dnMvLMqtxewccS
	Ae7W8QegW2d8nK0L7efFEYwjoljsxtI2FUfqPihmZ7byHWzJQ9n6baZd7G40zfhpTAVo7tzoQuEyF
	7DYN9P1G+Bo36bOMpLMlBG2sUcqKSdnen7Appyx1BJ9J/s6wmgLpkENf2KuIbusezs+CtXT6Cx89T
	YdAFAjJwd+nEeCk5stNtUvF6oA1nsKsmptpCpr3TFGU3C/Ygfn10XAh+cP1972caZGqwR9mbJdYxl
	OHZ7iK3t8oujOID6u3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WoU-0000000DPT3-0cq1;
	Thu, 10 Sep 2026 04:55:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WoS-0000000DPSW-41ds
	for linux-i3c@lists.infradead.org;
	Thu, 10 Sep 2026 04:55:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E6DD409FE;
	Thu, 10 Sep 2026 04:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5071F000FF;
	Thu, 10 Sep 2026 04:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789016104;
	bh=4b8PYqv4VWkKA9hB1zFAscNK0cfZC015fuLfwpBZ3G4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RH1pdJKJSnU7hItjQj34V4BOEhh1rua9xC9Ylp7MDPO+gzzNAlBT5xtpwojTqa/vq
	 IEUD4jxF/GrqOzUkQRP9W2jr171jumcvrhD0cMekeaUp9zyOHZOEFCBsAXU/ndRMnV
	 cjweQ/SRZzgVc5XMoQpBYvEiLHYFFlcSvSUYawGlFMzYyYgM/DiqfnFQ2vastSO2Uv
	 QydTfLtgZa3tp0odhE1T6SryJVNFW2z5KzAYSuK/vCeOCc152pJxHNRhQ2GAlIiY6x
	 3QHhP5Sb5HvxGTyuibtDNZzoppawOi08mzbokCUAkp1iSriLXJqNBl9ILbjR3dchnE
	 iHFHigmJiNvRw==
Date: Thu, 10 Sep 2026 12:35:14 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com
Subject: Re: [PATCH v2 0/2] i3c: dw: Document optional core reset and drop
 redundant name
Message-ID: <aqIzgh9hA7lcome_@xhacker>
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
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

On Mon, Jul 20, 2026 at 01:05:08PM +0530, Shubham Patil wrote:
> This series documents the optional core reset for the Synopsys
> DesignWare I3C master and updates the driver to match the binding.
> The DesignWare I3C master IP has a single core reset input. The
> binding never documented this reset, and the driver looked it up by
> the "core_rst" name even though a name is redundant for a single
> reset line.

Hi DT maintainers,

AIUI, the dw i3c explicitly says there are three reset signals in
total:
core_rstn, for core
presetn, for apb
dmareset, for dma

and I'm adding apb reset suppport, given this series has been applied,
we have three choices:

1.revert patch2 and document the "core_rst" reset dt-binding. This
equals to v1 of this series.

2.add a patch to add the "core_rst" reset, but allow no reset name

3.add a patch to add the "core" reset, but allow no reset name

Which one do you prefer?

Thanks

> 
> This series addresses both:
>   - Patch 1 documents the optional 'resets' property in the binding.
>     The reset is kept optional because the reset line is
>     integration-specific.
>   - Patch 2 removes the "core_rst" reset name from the driver and
>     looks the reset up by passing NULL, since the name is redundant
>     for a single reset.
> 
> Changes in v2:
> - Updated commit description for binding patch
> - Dropped reset-names from the binding
> - Added driver patch to remove redundant reset name
> 
> Note:
> The DesignWare I3C driver support was added by
> commit 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP").
> 
> The original Synopsys DesignWare I3C binding was added by
> commit 116e246a8bcd ("dt-binding: i3c: Document Synopsys DesignWare I3C"),
> but it did not document the optional core reset.
> ---
> Shubham Patil (2):
>   dt-bindings: i3c: dw: Document missing optional core reset
>   i3c: master: dw: Drop redundant core reset name
> 
>  Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 3 +++
>  drivers/i3c/master/dw-i3c-master.c                            | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> 
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> -- 
> 2.34.1
> 
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
