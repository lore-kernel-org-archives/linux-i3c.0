Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B849CA0FF0
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Sep 2025 05:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkQai6m2GkIDXhcbNDnY0NkXoKXM5POzG3oNeP1R17w=; b=fbkk9ti75ktHTE
	COsdSdvuy1tZGqCMynR7mJWRW3Wv53VOUhNWQkM6OnqtrcsBzipBoHx2k6iDLhkUcR35ye/JHh4j0
	TTP2C3/KC82WznvY+oM0bWsthn857lewonkmFoL8K8MpyyQgJqh+Bl4Q4Bc2OdknE0kn4VyLjdUDg
	gIujOrSeyA5TzdftuFB2vElEeLDMr4Kl7xpbOOIaI3C0loLEUgBirbWfrnLm0VC1kMKKxlzAOZjul
	2bVWZdK9mV/tPXSseyjH0jAM3uZUZPEIRboQ5uyvj1kMpI5AgNWCGuyg95XaKtFvF0k3qttztx3Lg
	UFp3HaZwk0eDnW36Bg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usx0T-0000000BCnF-3Ju8;
	Mon, 01 Sep 2025 05:23:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usx0S-0000000BCmd-0DFt
	for linux-i3c@lists.infradead.org;
	Mon, 01 Sep 2025 05:23:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E04B340273;
	Mon,  1 Sep 2025 05:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3FCC4CEF0;
	Mon,  1 Sep 2025 05:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756704181;
	bh=YWXOZPlrRtCclbTtH4C2u8OYyvUSZyzeFtK2fwsy+zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=acbMMyO2i05nDsjQ+3V/5j8hI4hruLY7R7f9unrMFYH7KVgHjtK8uAuQQp1ZZp0rG
	 15CmO9rNlNXrrgnhOpi5oz1EQBH4RnHs1IXq01rJqTRVqMwxp0sOvnpdD+IAqYvqvd
	 yiYZTDrUVlgPxpc1NhtQty8Dv1W2khsIO2Ly/mT22N7WAuFwEWlTfKEcfZJ7XJQRoy
	 GKupC8JfAN/a+KeXQog0ZPVVT7sZhE20oynouq3Wk3/2801HkxXltvuWvQTTRxhYnP
	 McIZ2dSo37WVDtXzRnDAMgiNVi+fkHzCU7caYcjfuDmX6l+1kXrobp7v7Ii6PBJ6iB
	 9ZytJymQ1InJA==
Date: Mon, 1 Sep 2025 07:22:58 +0200
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
Message-ID: <20250901-sly-cicada-of-management-bf6d73@kuoka>
References: <20250829171327.2590730-1-manikanta.guntupalli@amd.com>
 <20250829171327.2590730-2-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250829171327.2590730-2-manikanta.guntupalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_222304_110138_6A47E3AB 
X-CRM114-Status: UNSURE (   7.12  )
X-CRM114-Notice: Please train this message.
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

These two are completely redundant and useless sentences. Binding cannot
specify anything else.

Instead describe the hardware.

Your previous patches for bindings also had completely redundant commit
msg. You need to write WHY you are doing changes or describe the
hardware. Repeating the code is pointless, we can read the code.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
