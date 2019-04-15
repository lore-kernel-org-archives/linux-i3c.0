Return-Path: <SRS0=HC+M=SR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE004C10F0E
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Apr 2019 18:47:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA13B218D3
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Apr 2019 18:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GJJREP/Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ODWKXHOB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA13B218D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=HhwPWFI27bs8gxAifsKFSFlyKEry0xqQA4XV1c+CLo8=; b=GJJ
	REP/ZZPTQ4ksXkeOWr7Cr8miNpmscmkog64b6GZMWawijuSY1GmRZ/SznwfUIVWpZ7XbpYU1vnESR
	+GtM5DoZGPypH35YIf5qqbwsLsK0lcfq9UOI0MXc8x0Zu6IjeMbxXbFalBpe/sioETKYUxFxh/oaO
	jpyAFmmkDEX6K5rgiy3RIALOWP12N0LhcbnNDbeRDjUfoDN8J3Qglzs+SWPDZvAt93ZnYuKhQZkbC
	x9Vy+B6yAx7Yjje9VgEjs097BvaKdXVH2zPjZ+hOWa9yv2yd7H23eXqjEOSAPh63sUdLUSy7/Z/L/
	koSEJvaID3p3pHSSAB64Z7IBVZU5fXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hG6dZ-0004AD-Ax; Mon, 15 Apr 2019 18:47:25 +0000
Received: from smtprelay.synopsys.com ([198.182.60.111])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG6dQ-0003yh-L2
 for linux-i3c@lists.infradead.org; Mon, 15 Apr 2019 18:47:17 +0000
Received: from mailhost1.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id 891E510C10A5
 for <linux-i3c@lists.infradead.org>; Mon, 15 Apr 2019 11:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1555354036; bh=RouBlRyile8lpIsEs6QnMmaLqtH/P+K3Vpq5XE/IAyc=;
 h=From:To:Cc:Subject:Date:From;
 b=ODWKXHOBC0WFQ+HEQSuyecbKlWAPEmdkfKyPWUyEWnVmVtCK20h2cMknwDWRyKAgw
 RsMsNzyLDfph1LvORNOLlWnC5eFFClTlXDuRl0XytqAmhmhsKhj1h3WGi7bu2aIopq
 CAWAMlltm7YOyoyr9ilzK7IC5kWGMPowdiddVUjeu9AQe2r5sNyKx/pGfmL/M3FFB/
 4eo2C7kaMpYZP4Ha+K4HwQCBITj4pZPOa7n3wB7QBX96pbWgumXAYqpJjoYBOdbN5T
 M+0RIk8xz9/gGuahFtv46MGbsNvGjJgZrRMc23FZ6saI0VDyEGj/e9NmjnfNdyDh+s
 iIEqxS3RFbe0g==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost1.synopsys.com (Postfix) with ESMTP id 92CD05B6D;
 Mon, 15 Apr 2019 11:46:45 -0700 (PDT)
From: Vitor Soares <vitor.soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: [PATCH 0/3] Fix i2c and i3c scl rate according bus mode
Date: Mon, 15 Apr 2019 20:46:40 +0200
Message-Id: <cover.1555350118.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_114716_689245_339CB4CA 
X-CRM114-Status: UNSURE (   6.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: joao.pinto@synopsys.com, Vitor Soares <vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch series fix the i2c and i3c scl rate according the bus mode
and LVR register. It also introduce the mixed limited bus for the
cases where i2c devices doesn't have 50 ns filter but allow higher
clock rate for i3c transfers.
Please refer table 5 and 10 of i3c bus spec v1.0 for more detail.

Please follow each patch commit message for more details.

Vitor Soares (3):
  i3c: fix i2c and i3c scl rate by bus mode
  i3c: add mixed limited bus mode
  i3c: dw: Add limited bus mode support

 drivers/i3c/master.c               | 44 ++++++++++++++++++++++++++------------
 drivers/i3c/master/dw-i3c-master.c |  1 +
 include/linux/i3c/master.h         |  5 +++++
 3 files changed, 36 insertions(+), 14 deletions(-)

-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
