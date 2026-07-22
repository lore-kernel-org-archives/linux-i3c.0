Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA30C44536
	for <linux-i3c@archiver.kernel.org>; Wed, 22 Jul 2026 19:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOmnS/6tG0NObT0l9xu9PA9Fa+37SBakB2na6/gJ8UM=; b=4H0QylUMfnzu7n
	GseKKKk40hqF/CiDL15kVq5dfOkuMN0bPj8SxtFoBV/wVv8fQJoqmlt1U2cSLG7PB6J1zMhylwyko
	cgJgRs//5iU1L4CLR06/BOs78EuVqrd+JgAGA8aogT4iAggdn+n5UL7phoAzU4k8W/jUsa/myp/c3
	fJmbIwLwW8tgadh0YkOyJi3QKIJ9EnQKCjcyrIsypr6X7X3GdiZsVgt7Qjyj405Euq98cRZzZCi3F
	2jjUcKDLZR4dQTcFkQ4cCDIutDinj4pzlV+oc7oqoBu2LVInjwUC92ggFGimVa226f9/X50okGe1Z
	TyGPGIaMMvQUNz3NtKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmd4Z-0000000Cfgg-0sAt;
	Wed, 22 Jul 2026 19:57:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmd4X-0000000CfgD-3a1p
	for linux-i3c@lists.infradead.org;
	Wed, 22 Jul 2026 19:57:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D1A0600AB;
	Wed, 22 Jul 2026 19:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945261F000E9;
	Wed, 22 Jul 2026 19:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784750260;
	bh=l0f8hOysn5ymCLf58esGcq6d11WZH7Aq4bS7k2BPgjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ppw7AmucqO/1MTSoLAdEAinnZ/SF7ydw39dXDfFaD7iutHln3ZNaQkysiVpVSSltZ
	 3esaoFllLCZdQCB+iukvlw/gb4G4Zpog73WgTQzTAXge2yrJqWWLeZp9Xk3gsoVbFk
	 fIoAFNQDn/J8/7TWY6cu1yXphnLBZLSAEl34SIQx+3i34/otJKMQSSWpxeTwjUrZ8s
	 zc0adURqArjCQSGlzTXAiggeBqkr9ZmHfWQc63+eG4lPafisT8TcKeYVACrvfA9Fyq
	 ZcGsqcZBek0pnLSdFvA+32FGl7+sWKi1HGHTGUjo2mO6UJWC5MiWeh/hPUmIY0L3qZ
	 Y4K55oyDSpjrA==
Date: Wed, 22 Jul 2026 14:57:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Frank.Li@nxp.com, devicetree@vger.kernel.org,
	radhey.shyam.pandey@amd.com, alexandre.belloni@bootlin.com,
	conor+dt@kernel.org, krzk+dt@kernel.org,
	linux-i3c@lists.infradead.org, michal.simek@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: dw: Document missing optional
 core reset
Message-ID: <178475025970.1687978.1532465859692058077.robh@kernel.org>
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
 <20260720073510.1869623-2-shubhamsanjay.patil@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260720073510.1869623-2-shubhamsanjay.patil@amd.com>
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


On Mon, 20 Jul 2026 13:05:09 +0530, Shubham Patil wrote:
> The DesignWare I3C master IP supports a core reset input, but the
> binding is missing the corresponding reset description.
> 
> Document the optional reset property. Keep it optional because the
> reset line is integration-specific.
> 
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---
> Changes in v2:
> - Updated commit description
> - Dropped reset-name from the binding
> ---
>  Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
