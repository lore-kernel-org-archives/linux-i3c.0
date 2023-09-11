Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C214EE7FF4
	for <linux-i3c@archiver.kernel.org>; Mon, 11 Sep 2023 08:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9QxAOj/tcSmJp/BbVE/Qk8RsQGSaxxsor12OPDA936g=; b=LXxjaWQWZrp2ki
	qUWo+h3tqKHgPkgbQ5yO0Ri2zxPPSQkI8giFmjEWIolvgkCZz9T8ygdmPDjgkPjl+6aGqiVuxW8pv
	B1w5ro1/DkvyMqdSQU6JDO1LckP1E3HpxI0Mi6q7+o8off4A0P2BUOs5rC0CpdYlrwM4tdJUwNgXo
	FJvIrp2ELjWGOLI2Nuqgf1QDilBNWJOV8MBVn+1DBraYszV5khdllrtFiUHEM/JRIncEav8Xqt2S7
	e4rNK4RqZzHVuBCpefHEG1lX0ZtlI99mQ3SBTWoJSa09bSdvqKdfDmface4/Qrl0RdzPNJIJTY1p+
	dAG+o1ktpKBKOMIFaevQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfcEo-00HXPU-2s;
	Mon, 11 Sep 2023 08:25:42 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfcEl-00HXNT-34
	for linux-i3c@lists.infradead.org;
	Mon, 11 Sep 2023 08:25:41 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id DE13A24E2C1;
	Mon, 11 Sep 2023 16:25:14 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 11 Sep
 2023 16:25:15 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 11 Sep
 2023 16:25:12 +0800
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: <alexandre.belloni@bootlin.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Joshua
 Yeong" <joshua.yeong@starfivetech.com>
Subject: [PATCH 0/1] Fallback mechanism for GETMXDS CCC
Date: Mon, 11 Sep 2023 16:24:55 +0800
Message-ID: <20230911082456.23239-1-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_012540_132560_A431EDFE 
X-CRM114-Status: UNSURE (   7.60  )
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

Some I3C hardware will report error when incorrect length is received from
device. GETMXDS CCC are availble in 2 formats; without turnaround time (format
1) and with turnaround time (format 2). There is no mechanics to determine which
format is supported by device. In case sending GETMXDS CCC format 2 resulted
failure, try sending GETMXDS CCC format 1 instead.

Joshua Yeong (1):
  i3c: Add fallback method for GETMXDS CCC

 drivers/i3c/master.c    | 33 ++++++++++++++++++++++++++++-----
 include/linux/i3c/ccc.h | 17 +++++++++++++++--
 2 files changed, 43 insertions(+), 7 deletions(-)

--
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
