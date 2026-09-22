Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71912C982F1
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Sep 2026 07:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dV2JwCZc33MsWgNydg5TZdCXB2BGIEdpWfsLCOZ9QY8=; b=dmk9Vdrst8cvDA
	ftJVO7jac4an7gJKPpeN+BYEcAfqn1o/s9UFflNWslVXRMV6Z5Ms8k78wDv2odxXSWGafQN00yDhz
	megUtXWYsMOk4FP3EEWM7+qhBUk/7qwAJYAwLVss3i560Z3co2hWAiomL7JlItHNUZ+HppVeQ2Jrn
	2UWz0kfUeQti8813TgpfgL1dF+j3SsMGTJh3VmClSixWJ29hslG4snQ1Hu0/DbCiasg2DBIyzcTCq
	Fw3sAnAYoGw4RwumkcI77jY1OYWvj0u9cTycveqJUur3C49Wc0qpIuiT3SrlnqY3fkILcpyK/csAJ
	WAqpxWh6IripyShOa6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8utI-00000004VHT-0eD2;
	Tue, 22 Sep 2026 07:26:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8utH-00000004VHK-0llm
	for linux-i3c@lists.infradead.org;
	Tue, 22 Sep 2026 07:26:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8453A600CB;
	Tue, 22 Sep 2026 07:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD371F000FF;
	Tue, 22 Sep 2026 07:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061970;
	bh=BpljJpE1b315yujumf4I9jSTrDZ7KqlruhwMFwGQENQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RXZcaGxgFtDUK2pQ7klnorWoy1uX9YBvrE7vt2++fQNO7NMxfSdzel3zMjoDouKJ5
	 j6rsuP78n9/LMf1q2PItkeIZOO9t1g2/wTEAvSH8j+SPHRJompY/PxQelvnUeqBYfb
	 fyMoC0Coe/1rTL6gTdbs+s44MJoh7ajvN/z8DBGS5XbsE7koDf8sg4ViiZJbGJxYUk
	 2RCQNlI3hN24IUY08M11W8M5kvfl/X/urKvOgb3oDeC754oPbFTRtAMqD9aiNCLyYn
	 IlWbMZ+pvK8pu1aNvgOKKBLSTgYqx9OFPr2X9UT5mIZdnacXmQbjnHfby/F7Y0A0zg
	 C0Ea5Ryp3lKuQ==
Date: Tue, 22 Sep 2026 08:26:04 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v19 0/8] Add support for NXP P3H2x4x I3C hub driver
Message-ID: <20260922072604.GD2348773@google.com>
References: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
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

On Wed, 16 Sep 2026, Lakshay Piplani wrote:

> This series adds support for the NXP P3H2x4x family of multi-port I3C
> hub devices, including their on-die regulators and downstream I3C/SMBus
> target ports
> 
> The series introduces:
> - Core I3C master enhancements required for hub support
> - Generic I3C hub framework
> - MFD driver with regulator and I3C hub child drivers for the P3H2x4x I3C hub

Patches 4 & 5 never reached me.

Please submit a new version or [RESEND].

-- 
Lee Jones

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
