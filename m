Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F6AC87FD2
	for <linux-i3c@archiver.kernel.org>; Mon, 11 Aug 2025 06:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fg3KDST5Ek/bBJH9YANK9sH3qkyDkJj1gCK6bsaLh2o=; b=KKBPJ4PsJBY7WL
	yOKBpAk7i+PVb7JLP95C240IvmP4Q4TM3F7k/TuU5hgxcEGVDtWPZb0bhXa7WuGS+6xluYvHH9IfT
	2QYDROIjlVdO3zfRhJo5wuPT6eSsOu44B0J+vcy1/zBFSmkf4cp73R0oU52wprjUjMKfVbc3G+Z1L
	M1KiV9iSwdVyCJI+saUzNOdA7xM3d71WEx4lFZ8uDqoFl9oiT/OdTpb2L3cu043Eogt2A1kFDJFhC
	LjYB9SbNMeL3rrk+BPz21+iegFHFINHIVG03tChFj5mA3fWtJTiRScfsrXHg8A8PDMi6fxkxS+Cum
	91IVxMGu8md54nC9zb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulMSl-00000006eae-10Cs;
	Mon, 11 Aug 2025 06:56:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulMSi-00000006eaD-40Fa
	for linux-i3c@lists.infradead.org;
	Mon, 11 Aug 2025 06:56:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 26BDBA56AA0;
	Mon, 11 Aug 2025 06:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36278C4CEED;
	Mon, 11 Aug 2025 06:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754895411;
	bh=NASEFLahtizz8hYjdKKVVlrTZn03FNi3PX2ZocIcjGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TjVqq5E6Cl28VGfZd3j8GrYFnckBeMgMBOk9BR3eey5plCCslOl05nOE/aMdPK5cM
	 cxq4CcL6bF0yZjLwxPP1X33orcLQlc4eQAN+Lr14r7cdoTpt1D2srZYZdm4WOvuE4m
	 LikZZd4SNBTJyugaPX0aYU0lVv+6fS9hS/dejDuECtEipdDWFwLCrUuX+hqoxU6YrH
	 WbBpIBSsUlwk08EwrENAO1E57EUJTcQrepIADiGU0TmuVD/4TQm+UCpFc0xphBKDYf
	 V3LnVIOHH3HkfcCm0Ih6eCh3/1gBXuknH+oZx0ZsT35RnJ/25H6k6eoM7FFcbO+m9n
	 q2ZUawcMqLzrw==
Date: Mon, 11 Aug 2025 08:56:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org, vikash.bansal@nxp.com, 
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com, Frank.Li@nxp.com
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <20250811-clever-stingray-of-will-eff27b@kuoka>
References: <20250808132033.3996614-1-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250808132033.3996614-1-aman.kumarpandey@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_235653_062763_C2ABC086 
X-CRM114-Status: UNSURE (   7.74  )
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

On Fri, Aug 08, 2025 at 04:20:32PM +0300, Aman Kumar Pandey wrote:
> Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> multiport I3C hub family. These devices connect to a host via
> I3C/I2C/SMBus and allow communication with multiple downstream
> peripherals.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> 
> ---
> V1 -> V2: Cleaned up coding style and addressed review comments

Which ones?

You must be precise here.

> V2 -> V3: Added mfd device support for i3c hub and regulator.

Still not tested, still fails. :/ I will not review this, please reach
to your colleagues in NXP to explain how to test code before sending
upstream.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
