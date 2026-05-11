Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E536CD3427
	for <linux-i3c@archiver.kernel.org>; Mon, 11 May 2026 03:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=23ndIFH9f30kYopVjWB4/Se/4LUvz43S7CMWdtQBjKU=; b=CteqV/Zb8zA9uT
	R145//HQLzIoKqDCZNkTRjyqxZRnGUm7wQECgiBRsMFp97mLAnNezKRPx10m7HUy2uC172YM0SHsS
	maB7GR7fwSZsZPb9xkkD+iqjf1FUFsR4+P4F+bS/Yl7FlA4lWuk+lyVze2U4yLsFAH/zD1AGLPvhB
	u1r0c0n/J6eaGoEZMqPDOJhTdHFSPNkyD4RXK48Ny4nX88cMRbNq/awnC9grPv+dwe+5oo29fqfWk
	zoy5JOgs1Ujw/lr31vDznZVJkci7RvmCVuRGfBkgbcRjw8mFvywbhRFuFTVBLwOjAGX5WIFgEoeO7
	VbMCqBKSzs0wsPTLx3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHTn-0000000CBqh-0wEl;
	Mon, 11 May 2026 03:38:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHTk-0000000CBpX-3P4L
	for linux-i3c@lists.infradead.org;
	Mon, 11 May 2026 03:38:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90DC2440F7;
	Mon, 11 May 2026 03:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8B9C2BCB8;
	Mon, 11 May 2026 03:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778470727;
	bh=5UGYZDvgH7+LWWEIacfJiFNR/NrSOGrocturbbpTTZo=;
	h=From:To:Cc:Subject:Date:From;
	b=S/s+ZgoOkW+XAfVwwvk83MIROjdnH88nx/bOKZWjSAJZeR0PTJ34tqfwGETA45Onm
	 q4jsxzIIEJilXg2B9A/WleCypDR+wSaC3XcIK2MfJ0Cp1GeFH5YlS3NgPG1kwTl0th
	 krReXY7+Tx+aGlWIIuy8hCfdh8cCt5FUpKGqX3qn9d13GHeRliVDdqBgPjEaIDRPPW
	 MtrlD+yGSSnrv3WuVS6Vdnp26PJYTJv+0UXguLZHngZhMBbdHK8oxxFSbOckJvNYWA
	 37VWXVFAAVmK0tcLnxb+8m5+Q82y+RzImD0mBWCbkSL/EYEIfU77dcbnYvR9NYEuvy
	 Ph7yJM0WlLNbg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] i3c: dw: Add apb reset support
Date: Mon, 11 May 2026 11:19:42 +0800
Message-ID: <20260511031945.3228-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_203848_869917_FF0CB99F 
X-CRM114-Status: UNSURE (   7.96  )
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

Add support of apb reset which is to reset the APB interface.
The first patch is to document the exisiting reset dt-binding. 2nd patch
is to add apb reset dt-binding. The last patch is to add apb reset
support.

Hi Frank,

comments to question "why not name the reset as "apb" instead of "apb_rst":
exisiting core reset is named as "core_rst", this is to align with its
style.

Thanks

Since v1:
  - add dt-binding


Jisheng Zhang (3):
  dt-bindings: i3c: dw: Describe core reset
  dt-bindings: i3c: dw: Add apb reset
  i3c: dw: Add apb reset support

 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml    | 10 ++++++++++
 drivers/i3c/master/dw-i3c-master.c                     |  7 +++++++
 drivers/i3c/master/dw-i3c-master.h                     |  1 +
 3 files changed, 18 insertions(+)

-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
