Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F56FCAC592
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Sep 2025 20:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+eSyA9xzyECTFU8vFLSN/HFpKxrLSapY1AyYij0/dos=; b=m2KKOSDfYqgknm
	DgCTV6I2CADxefvtyWSnmcxQwa6j4SIFeFmLh5Fq2r4E2Tj245jbeQD60GzGXXcKIvLMA964omBtI
	r6xRF9MMMOqPABHtdUJWHMXA/UQdRdGzqmcW8jz3YVDNULgRpory4paA7axwoBjJYgAjjQj+JYZR4
	5E/VsWMHz36P47dkPcR4xtYre/wq3fWNZKX8t2CTJqpzdzb8RMRQwp13lau/WlpBu3N0we8i04dH9
	DWTTW44sRFhnwebyWAMjbqvJqxkG3INyw52c4GvuEfiSQKJYZEBF8MQbU9NEhMvZZM8klnRmPDRrX
	OQgaguOZ2J5oMzpDDfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzi8C-000000041Uh-02Kf;
	Fri, 19 Sep 2025 20:55:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzi89-000000041Tt-3phi
	for linux-i3c@lists.infradead.org;
	Fri, 19 Sep 2025 20:54:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9329540BB6;
	Fri, 19 Sep 2025 20:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4809BC4CEF0;
	Fri, 19 Sep 2025 20:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758315297;
	bh=goXMosi04cs696fzSOhqaLlCV7yhoQls3NSmu33eYr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ibiw7QD+DTelbLjysa/Y0mwuQ2L3EV7Uaa4ZPs33v+stGqv/ZpA3DlQ40b7qDrPw8
	 1JFb3xZxTQufmmApRcyB3y+cdZ2h1+i1twUW0UyKyQZzbnjMwQkrJ3YTXnT7IpNxsL
	 ld6fH8aE0jYOdrH2AD21ZOC8g73DWsN3ygQm4e+rJdhQZxY8DsNJ2PAi0gimoocrbu
	 lubvXMj2hhqxcEWYxK7UUX5Tu+n9QDkQkn+6Yhn4ZLFx1fqrg2Oiyzt4aggrAaDRRh
	 r+8iulWiFQ4yh5UU4BkIZxZDDlPNTwcnCn4ZGlGGLZWoUQk4JC7lwVh1bnPYz3LgPy
	 xQi7tLxZ0pjjw==
Date: Fri, 19 Sep 2025 15:54:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: shubhrajyoti.datta@amd.com, gustavoars@kernel.org,
	linux-i3c@lists.infradead.org, jarkko.nikula@linux.intel.com,
	conor+dt@kernel.org, Frank.Li@nxp.com,
	linux-hardening@vger.kernel.org, radhey.shyam.pandey@amd.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	srinivas.goud@amd.com, git@amd.com, manion05gk@gmail.com,
	linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
	kees@kernel.org, michal.simek@amd.com
Subject: Re: [PATCH V6 1/2] dt-bindings: i3c: Add AMD I3C master controller
 support
Message-ID: <175831529495.2200422.4249536925418655558.robh@kernel.org>
References: <20250910112954.553353-1-manikanta.guntupalli@amd.com>
 <20250910112954.553353-2-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250910112954.553353-2-manikanta.guntupalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_135457_971967_4A3132C9 
X-CRM114-Status: GOOD (  11.35  )
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


On Wed, 10 Sep 2025 16:59:53 +0530, Manikanta Guntupalli wrote:
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
> 
> Changes for V5:
> Renamed the xlnx,axi-i3c.yaml file into xlnx,axi-i3c-1.0.yaml.
> 
> Changes for V6:
> Corrected the file name for $id in yaml to fix the dtschema warning.
> ---
>  .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
