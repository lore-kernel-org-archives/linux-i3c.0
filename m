Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF66C35FF3
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Mar 2025 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HXE0qchpbC1lbWE8H3ktRwhmxjnFiLJT43PASxLyG1I=; b=eMNhigYGc/UF2Z
	UK8XzFqJSp+yaGVe/M2lTu9NmJyn7m8r+//pYueAVj2CejhuKugcJeUIAllaewOp4VqKU8cXxPB8a
	NGjY0y8Jw9Odv9eubyTAlxGcPDW6X9G335bcogTJ6EZ1HgM0jl6c24gvLrzJjlnRMwDFNB9JDJQWa
	bHFwD1lKxBpwQly3Z2yYdUEYIGRC5DiIhGMq5a8ivOU5jfisexlHfLGqaLrrx5W8CztIrXq+VWB/x
	aWCWZ1ZLXpZxFLr7L3s5MhRDKRjf8I0699I9cU/EwuKNnARA6JnR2nSbr0X0fNjj/IsBBk30eVkVw
	hUZ9DFvRM3tz2HZHKIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7Aj-000000020iM-2AxW;
	Mon, 17 Mar 2025 09:54:13 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMX5-00000008csP-44YK
	for linux-i3c@lists.infradead.org;
	Wed, 12 Mar 2025 13:54:05 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 524141A246B;
	Wed, 12 Mar 2025 14:54:02 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 06F931A0420;
	Wed, 12 Mar 2025 14:54:02 +0100 (CET)
Received: from lsv03121.swis.in-blr01.nxp.com (lsv03121.swis.in-blr01.nxp.com [92.120.146.118])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 201841800088;
	Wed, 12 Mar 2025 21:53:59 +0800 (+08)
From: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
To: miquel.raynal@bootlin.com,
	conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	manjunatha.venkatesh@nxp.com,
	rvmanjumce@gmail.com
Subject: [PATCH v4] svc-i3c-master: Fix read from unreadable memory at svc_i3c_master_ibi_work()
Date: Wed, 12 Mar 2025 19:23:56 +0530
Message-ID: <20250312135356.2318667-1-manjunatha.venkatesh@nxp.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_065404_141301_9A826C5E 
X-CRM114-Status: GOOD (  11.66  )
X-Mailman-Approved-At: Mon, 17 Mar 2025 02:54:11 -0700
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

As part of I3C driver probing sequence for particular device instance,
While adding to queue it is trying to access ibi variable of dev which is
not yet initialized causing "Unable to handle kernel read from unreadable
memory" resulting in kernel panic.

Below is the sequence where this issue happened.
1. During boot up sequence IBI is received at host  from the slave device
   before requesting for IBI, Usually will request IBI by calling
   i3c_device_request_ibi() during probe of slave driver.
2. Since master code trying to access IBI Variable for the particular
   device instance before actually it initialized by slave driver,
   due to this randomly accessing the address and causing kernel panic.
3. i3c_device_request_ibi() function invoked by the slave driver where
   dev->ibi = ibi; assigned as part of function call
   i3c_dev_request_ibi_locked().
4. But when IBI request sent by slave device, master code  trying to access
   this variable before its initialized due to this race condition
   situation kernel panic happened.

Fixes: dd3c52846d595 ("i3c: master: svc: Add Silvaco I3C master driver")
Cc: stable@vger.kernel.org
Signed-off-by: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
---
Changes since v3:
  - Description  updated typo "Fixes:"

 drivers/i3c/master/svc-i3c-master.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index d6057d8c7dec..98c4d2e5cd8d 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -534,8 +534,11 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 	switch (ibitype) {
 	case SVC_I3C_MSTATUS_IBITYPE_IBI:
 		if (dev) {
-			i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
-			master->ibi.tbq_slot = NULL;
+			data = i3c_dev_get_master_data(dev);
+			if (master->ibi.slots[data->ibi]) {
+				i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
+				master->ibi.tbq_slot = NULL;
+			}
 		}
 		svc_i3c_master_emit_stop(master);
 		break;
-- 
2.46.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
