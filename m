Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DE2C5472C
	for <linux-i3c@archiver.kernel.org>; Sun, 25 Aug 2024 01:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1BmcjJGGgWIyNLAGXZaMUejliBHOfdYwGmzvZPj0qsc=; b=hh9Klak2hTbCz0
	EEk1wU+5sJB0BUYa5Y2gcF5rAC/GWhBvD7LUjuPKupKwLz5pYy/tQrYsH7oqLfy2QVamUVFNAAW2m
	hCQP/qE5SQ23odHvEhI0XgY+yN6x3vtCPvNQYBNIhMODtT83wXa2pjKw4oYySbw/0lFMSyDYcDZYr
	I51j1HTLZ4b/FOQ3tWN/z+K/P/u7nzBBWjWTabL/u5sSP+SPq96TgL3KeMplF9qji/ewXmyt6GIsM
	wekF6NjnDXzz8mR/brauOFApIJ7P410In8Uy4yEOkkXfRmU0wWLLtySA0LJL0d2jqUXq2MVsx77uK
	hM4A5UDA/kQgzTOGYzUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1si1ts-00000003EBN-2H53;
	Sun, 25 Aug 2024 01:18:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQmY-00000005pME-01GB
	for linux-i3c@bombadil.infradead.org;
	Tue, 20 Aug 2024 15:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=SrXyxjbR+gNB+saYH77XaycG4zcD6r9nJBJDDav4zxo=; b=bjsOuuUrnmKhleoQixRUfaXdxK
	TEpYoFirpg3nweOuJfZ3AX1CDj3g3tXolGrwspxwoG/AAHEy43qzkB8euDLMqXDV88tv//zXFsMOx
	jYqo4I0TIvF5lLluYdCH5H4Jqv+J4Q/ufyMOcOI1WS0nHQYBcqrDcgTZpCjaISG9gsQcofVkF50dZ
	NDIsV+KntWufm2+6GpPaZ4WSsEQNA29r2j5gowbv+jgj8k5xugz/p3ph7xZJM03M8VaYwG5CU5h3b
	eAWHP8Z+DiSljEgvsH/1VJkt1ejwv8IVfBs1zuVDdgcRC7Pc5Ha2T58lNc08X29Sj37J/lsvQ071k
	9DDOSpog==;
Received: from inva021.nxp.com ([92.121.34.21])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQmS-00000009M4f-04GP
	for linux-i3c@lists.infradead.org;
	Tue, 20 Aug 2024 15:28:24 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 53F1F2023DB;
	Tue, 20 Aug 2024 17:19:23 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AC4762023D2;
	Tue, 20 Aug 2024 17:19:22 +0200 (CEST)
Received: from lsv031045.swis.in-blr01.nxp.com (lsv031045.swis.in-blr01.nxp.com [10.12.176.65])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 250911802200;
	Tue, 20 Aug 2024 23:19:21 +0800 (+08)
From: Ravindra Yashvant Shinde <ravindra.yashvant.shinde@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org (moderated list:I3C SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank.Li@nxp.com,
	Ravindra Yashvant Shinde <ravindra.yashvant.shinde@nxp.com>
Subject: [PATCH v2 1/1] i3c: master: Avoid sending DISEC command with old device address.
Date: Tue, 20 Aug 2024 20:49:17 +0530
Message-ID: <20240820151917.3904956-1-ravindra.yashvant.shinde@nxp.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_162820_178385_6620FD7A 
X-CRM114-Status: GOOD (  11.07  )
X-Mailman-Approved-At: Sat, 24 Aug 2024 18:18:33 -0700
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

When a new device hotjoins, a new dynamic address is assigned.
i3c_master_add_i3c_dev_locked() identifies that the device was previously
attached to the bus and locates the olddev.

i3c_master_add_i3c_dev_locked()
{
    ...
    olddev = i3c_master_search_i3c_dev_duplicate(newdev);
    ...
    if (olddev) {
        enable_ibi = true;
        ...
    }
    i3c_dev_free_ibi_locked(olddev);
    ^^^^^^^^
    This function internally calls i3c_dev_disable_ibi_locked(addr)
    function causing to send DISEC command with old Address.

    The olddev should not receive any commands on the i3c bus as it
    does not exist and has been assigned a new address. This will
    result in NACK or timeout. So, update the olddev->ibi->enabled
    flag to false to avoid DISEC with OldAddr.
    ...
}

Signed-off-by: Ravindra Yashvant Shinde <ravindra.yashvant.shinde@nxp.com>
---
change from v1 to v2
- Fixed the author name.
- Unconditional set to the false & added some comments.
---
 drivers/i3c/master.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7028f03c2c42..0dd8d1c28d58 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2043,7 +2043,14 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 				enable_ibi = true;
 				i3c_dev_disable_ibi_locked(olddev);
 			}
-
+			/*
+			 * The olddev should not receive any commands on the
+			 * i3c bus as it does not exist and has been assigned
+			 * a new address. This will result in NACK or timeout.
+			 * So, update the olddev->ibi->enabled flag to false
+			 * to avoid DISEC with OldAddr.
+			 */
+			olddev->ibi->enabled = false;
 			i3c_dev_free_ibi_locked(olddev);
 		}
 		mutex_unlock(&olddev->ibi_lock);
-- 
2.46.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
