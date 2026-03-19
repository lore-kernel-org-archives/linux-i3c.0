Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D88A1075286
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Mar 2026 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78sZ0QgtLVyohNURoGuLrRcdjzzDghQtBTB1lkttvR4=; b=NTyYO0cX1cW/+D
	p5wiUiI/SIAvbcmGhKkQSBlTNwplmgtPtjCVsqZZvvshgBbU6T20Ma5cZPoCLpsOvjs4gxWnIc3eW
	bVpB6tHoC/MBW5OT4OLqRPlUX4DRLh3lkCqiysxPYz6dJ0YxoBakqDgXQ9WxxGGg5yD6tN3DFLL6A
	wOmO0/T70/mIWst+DSAZbiuk2iK37MHOt3OZ0Na7fiuYBBwD3dCry8VLMV2cF8LuFWDo3bOlejA3w
	xR4kPLKkgVqM4bkXmv8RYp9R5Blziy63QtACJ0pPIR667RpxZb2w4tm2kRKEfLDU7FG/t+i8GrclM
	7Ez/3SJYVlrVtUgCkt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39rr-0000000ALA6-05JR;
	Thu, 19 Mar 2026 09:40:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39rp-0000000AL9y-2FAD
	for linux-i3c@lists.infradead.org;
	Thu, 19 Mar 2026 09:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F34146011F;
	Thu, 19 Mar 2026 09:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CC3C2BC87;
	Thu, 19 Mar 2026 09:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913236;
	bh=ZSn8Lu21liBhjll/ha1FTtomPiyxAKdHWnt+7n5pJY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJitGcoPZkhcTx1rxy9aCI9KqJFxx5U4jcsg6pZlvnRbd8D3LBHXnGPXE5i3XO9OG
	 Cbgb0SCrXgQWGISpb1c+etzsTOTzAHrvPJKD5OUF8yU384s9kwW8+kbFVhewYZvoUp
	 SNFNra3dnN5GLaO49Yj8pNE2/WxTPZFCpApPPlyDOty4xJum5qJIaf+jhZjUSFrpH8
	 0RgFRC6qrdBoFSUS1bxJMk2ApwDG7HIqZUzouKOWAnhOFtGnZPuDmJCawyDC2mfVHF
	 /9lOnbD7UqBl01IUSbs0JgqjPIardNe2zik7oX8HUdSmOVNm9GdcCi7/2C065jbPr1
	 xf1lhafENDbbg==
Date: Thu, 19 Mar 2026 10:40:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Len Brown <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, 
	Fredrik Markstrom <fredrik.markstrom@est.tech>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, 
	Suresh Mangipudi <smangipudi@nvidia.com>, linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Message-ID: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
 <20260318172820.13771-13-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318172820.13771-13-akhilrajeev@nvidia.com>
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

On Wed, Mar 18, 2026 at 10:57:25PM +0530, Akhil R wrote:
> Add I3C subsystem support, DesignWare I3C master controller, and
> SPD5118 hwmon sensor as modules to the defconfig.

Why? If there is no user of that, why would we want it? Your commit msg
should explain that.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
