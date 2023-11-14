Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED48C4332F
	for <linux-i3c@archiver.kernel.org>; Tue, 14 Nov 2023 03:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Li6xwdi77wuEvSeSE3U9d5bwtUpOrtLXhIYc0gnZfQ=; b=O2HbDCSOgRKflV
	cZiZ39ZJcX6MmzN6HLCaGpKTHows88EaKkqz3zOViQRA7ywDfrO2bQiVLUyb9ZM3v75vRSjxEbRZn
	aFznReaXFZns96f2K6A1N9FL6fukbn3c7Rdv9gBKZ3/7bTb/5DYCnvvh5dUaADe36FG2r28GAHrc2
	dueuDqmfXtSn6eVfAMYpy/VegYMM3WPhpshgxs9fGdJq6ucUREffx/yAJv0CL+V0hs5gg6u/fnupJ
	KaT5DW+KS2fQ5jlHoXD7my9+Mh57JQD/zCynqn/p59nlfK4VSu0T3XzlH2JmMaSPrFztYCTdFzCm5
	ukZVFp+6fHtJHCVp6oGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2kD7-00F6ry-2H;
	Tue, 14 Nov 2023 03:35:33 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2kD2-00F6pM-33
	for linux-i3c@lists.infradead.org;
	Tue, 14 Nov 2023 03:35:31 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8A6A924E258;
	Tue, 14 Nov 2023 11:34:43 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Nov
 2023 11:34:43 +0800
Received: from localhost.localdomain (161.142.156.149) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Nov
 2023 11:34:40 +0800
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: <alexandre.belloni@bootlin.com>, <miquel.raynal@bootlin.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Joshua
 Yeong" <joshua.yeong@starfivetech.com>
Subject: [PATCH v2 0/1] Fallback mechanism for GETMXDS CCC
Date: Tue, 14 Nov 2023 11:34:29 +0800
Message-ID: <20231114033430.9623-1-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [161.142.156.149]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_193529_151287_48C40AB1 
X-CRM114-Status: UNSURE (   7.28  )
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

Some I3C hardware does not support turnaround time in GETMXDS. Cadence IPs will
perform validation against length of CCC returned. Similar hardware error were
not seen in other IPs DW/SVC.

Joshua Yeong (1):
  i3c: Add fallback method for GETMXDS CCC

 drivers/i3c/master.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

--
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
