Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5340CD4F3C
	for <linux-i3c@archiver.kernel.org>; Tue, 19 May 2026 06:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZQVR9uKsTcxLn8azKDKKBTIKRbkEq+pP/uSCP/IlFRQ=; b=vHXy8V6icGnXxk
	qlMGhM1djUGEchhl/XSymTFQOwb7DlQkBvB5aSh2JDUOu1ExM9AIV0vHgndtoT+IWpegFxse3DTi9
	vVFU4SaKFYm7U4nrcOdliIdKVbrsD3/mWPJ+qlgBbc/JJSGLh4stTODDaTMoPw5ChercR6zIPy616
	i4QdVT2chzk66n155d6R0iM+Pwt3DptFzkeVZphT2XhEO4sGHrDNoOYN4bf5lBbFiZAc4t1+nPIYV
	E59rgPBiIibgZSbBuGu2850LlIzzo3PyaPqShw+IxARYvWBQqhhcZZdjIXbsc7x7EG+nocMGpzEfO
	7nmybCcy0nCYdwjxZATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDee-00000000HUJ-2ECk;
	Tue, 19 May 2026 06:10:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDec-00000000HTv-3WkB
	for linux-i3c@lists.infradead.org;
	Tue, 19 May 2026 06:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E41ED60212;
	Tue, 19 May 2026 06:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E16C2BCC9;
	Tue, 19 May 2026 06:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171009;
	bh=hBz6LTYI5t7x4hreKVlmTXs2Mvl6FjET6EY5b5DiR2c=;
	h=From:To:Cc:Subject:Date:From;
	b=nJkI6IgxQsCL7Ma5BbnEobWmhUntrZtd3CIDhqFvt18kfF4Hlf31g38SSadKQ8EGa
	 bxhrdWdjNXrgPcdiiMk3Plov1BHMujcvw+xSc0aPqE5TehGJNTtkbUCUKlJwgSpAFh
	 j/d7i4yYTs8HbWGmhRPL13mr5E1+6Zv+bN8zClLAztoKGlnwqE+MK4BR/ptD6TEwVv
	 dujm0n6g1ryvpUqFWYGfpGD5NsXgE7820+OELuqZuvIszSkYfwp3bh9F3e4/9vSfvA
	 mq7SF3a1fzy0jS2maJeR5PERs86IyHPfALkuK35ApjUBb39kG1PIO+NuyN6JTA/rcJ
	 RFkebmK5d+6xg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] i3c: dw: Add apb reset support
Date: Tue, 19 May 2026 13:51:01 +0800
Message-ID: <20260519055105.13079-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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


Since v2:
  - remove "_rst" suffix

Since v1:
  - add dt-binding


Jisheng Zhang (4):
  i3c: dw: Remove core reset "_rst" suffix
  dt-bindings: i3c: dw: Describe core reset
  dt-bindings: i3c: dw: Add apb reset
  i3c: dw: Add apb reset support

 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml    | 10 ++++++++++
 drivers/i3c/master/dw-i3c-master.c                     |  9 ++++++++-
 drivers/i3c/master/dw-i3c-master.h                     |  1 +
 3 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
