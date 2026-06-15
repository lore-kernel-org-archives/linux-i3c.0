Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E860DCD98DE
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Jun 2026 23:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vT40OYnHYIHyRkgl+o6ZF08YCq4OpGE3pWKS3ltG+RM=; b=JEwxkRoEasbOW0
	xHKwmwfY1+ya6ZA84uBrIlfbVjy4vtgXSTkvVoAT5bSMVceB1ydaslEPmz4FWVEDm+gc63RZp4Ji/
	MwGoDXIcIcYhtk2qcUGPNaOfLkDLYoB9elOWxGaE+R4utRNOzWuWF7BPlK947bK9nExGbqGzr8bm5
	rMtfTd3JBfwOOxqMwSYYeuLmwpSzGuADm71xA+niwT4Zx7tgRJQrA/Gsaaba/MhvZ1wT2bA1nZWz7
	gWI9RX4k9TLA7NExTByIm1bJIldq/f+U4ChA+whrVOEYvTRZAb4WBnA+s0lUPrr2ev5RK8Lcfwb/p
	YtJ0W03m0zdT2WfyxnGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGkF-0000000EwY8-2s46;
	Mon, 15 Jun 2026 23:29:31 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGkC-0000000EwVT-0cZ9
	for linux-i3c@lists.infradead.org;
	Mon, 15 Jun 2026 23:29:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D26CBC4FED4;
	Mon, 15 Jun 2026 23:29:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 668A6601A8;
	Mon, 15 Jun 2026 23:29:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 164BB106C96F3;
	Tue, 16 Jun 2026 01:29:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781566162; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=+aFICluLxl1YQYB539NIMAyFqzwzwtH7RKM4CStfk/g=;
	b=UX1Cs3FpiFya0xBUfd3tQH777nYyMi4aNnSLzptl/wn/o+t8d09saDwOdZHHFvMCyvlirz
	BKrQUYF0jq4TBEwqw4yq6o/v4Hwn0qmlWJ0lcaRmlxW8/vzdTHIUbaRMmY+BU86IpTBq2J
	0z3IdUDx3fwYg/oDWZDKTXoTqgjK9vHcPhDQaVKhU/cZo+V3exAj7AbAchKT9S8ZiovjTc
	SrDDim5yV2kyxKNFkSOJoMY3koD2W3qsW6T7p9DEesc8daJP04z8NF7tFZ5ctWZYhj9Teo
	KCvVUc2way8YaTZFUKdJlgshEeSYWdPtl96NSyBJN5kbadVVfhttVZEdQQE6og==
Date: Tue, 16 Jun 2026 01:29:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: vikash.bansal@nxp.com, priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: (subset) [PATCH v11 0/9] Add support for NXP P3H2x4x I3C hub
 driver
Message-ID: <178156613342.628917.851293723714358205.b4-ty@b4>
References: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_162928_370294_144552F8 
X-CRM114-Status: UNSURE (   9.43  )
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

On Fri, 12 Jun 2026 16:48:07 +0530, Lakshay Piplani wrote:
> This series adds a driver for the NXP P3H2x4x family of multiport I3C hub
> devices.
> 
> This is an MFD driver integrating I3C hub and on-die regulators.
> 
> The series introduces:
> - Core I3C master enhancements required for hub support
> - Generic I3C hub framework
> - MFD driver with regulator and I3C hub child drivers for the P3H2x4x I3C hub
> 
> [...]

Applied, thanks!

[1/9] i3c: master: rename i3c_master_reattach_i3c_dev() to *_locked
      https://git.kernel.org/i3c/c/79c41666b397
[2/9] i3c: master: Expose the APIs to support I3C hub
      https://git.kernel.org/i3c/c/8d8afa428318

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
