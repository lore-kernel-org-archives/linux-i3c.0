Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0651C55162
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Jul 2026 14:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWuLobqntuPOQoskpywQBz9a8AaaqVlLSREEcfGoGeA=; b=36M0XC1rgQtLeh
	i4yy2CpVpa0b3bA4e2zUBiUjqU4dve4hYU4iO83pChor5oUNLqQuMMj62krfb9x8zINXV58ftWpr6
	dR7sWNevZiU1NsruAjTFHh4oIRjFsw9+BFuldJ1pFNC2wiHnhnRU2xs/HWqVrjKWMiCFBjbnbSVN/
	W647eRlULZ40VP5e+7u/Hbnuit76Zs/C6la8dKweLOlIjiP7XPdYSemG5V98566xEVxTnbiTnrcpl
	JztBhBcByNNZyXXusldIJ0kw26D0WlikJiVshGzBokmy4a+5XjIBzwF2lLkTfMx76/jDhECFLB2X2
	Ylf49LHO2dulBBM9njGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRp9-0000000Al2l-2Dau;
	Thu, 30 Jul 2026 14:33:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRp6-0000000Al1t-1Fi8
	for linux-i3c@lists.infradead.org;
	Thu, 30 Jul 2026 14:33:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 691764E41005;
	Thu, 30 Jul 2026 14:33:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C02B602B8;
	Thu, 30 Jul 2026 14:33:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C59E11C15D06;
	Thu, 30 Jul 2026 16:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785421998; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=mfA+QB9rWd3etPgxphn/JIAS9tjAN+8oo8iyiuZepxw=;
	b=z9Oc/gM0gxr7ET4b9zJ9I5+4u06/ium0hAYYxNZOycRvAiobjn0Bc1jlsg6UGemiyy1gvx
	+VHgcnA0+9BTG4vZgHE47u3WkXXnsP+vwoyp+IVJ0xTCgb/P9sn5npjIRheLgiZcR1/fb0
	6L+BCFjQo4gvI+MZ5nwjdKoo9eR3lv9lUvsatG6388lJpxjo6LEHFKNCmU3cheWf4W9VmA
	xmALTUiGn2ttWIx6JaZ4vbHX39GV4ilf+R68H93iG/EhFC25s2xTHlCvlggh2U6JRZ7Xdg
	R0nMdKpr3NgWv+6GAFRB+ZAQZEwb7Pm/VwiaTR7NSjVXNk3Ste4jJULr1DYsLw==
Date: Thu, 30 Jul 2026 16:33:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com
Subject: Re: [PATCH v2 0/2] i3c: dw: Document optional core reset and drop
 redundant name
Message-ID: <178542198409.1790758.601925059498244846.b4-ty@b4>
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_073324_503313_DCF12A46 
X-CRM114-Status: UNSURE (   8.53  )
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

On Mon, 20 Jul 2026 13:05:08 +0530, Shubham Patil wrote:
> This series documents the optional core reset for the Synopsys
> DesignWare I3C master and updates the driver to match the binding.
> The DesignWare I3C master IP has a single core reset input. The
> binding never documented this reset, and the driver looked it up by
> the "core_rst" name even though a name is redundant for a single
> reset line.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: i3c: dw: Document missing optional core reset
      https://git.kernel.org/i3c/c/904473e58db7
[2/2] i3c: master: dw: Drop redundant core reset name
      https://git.kernel.org/i3c/c/283e91b86613

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
