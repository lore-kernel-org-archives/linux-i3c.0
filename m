Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A36C433FE
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Mar 2022 16:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CL+HFmLLzGfTIqad8lrTi8F/0nOjnRvyZrP78JMeMwU=; b=iXZd4nFsYKSkTB
	l/+NzXD4Oy8VIDjno6GZEIDBSw1xMyedWjzJkANS2p8RGKXK8DRBYSm/CI+bmJqyvxdZK3W2hDM7f
	a2yqvsF+UVcpZCXSW1AAveq5Rz9gP+JCcfK0AVbMjskGNiKSBMw0en2T6BwbqFv5ceTp1xpKpGr2q
	SZgrbKEjeRrzLU96bdsqbxVQyesdaKsf8OReiUU02m32Ow7QvONklaaEgVqwMK0qwZp1xCbr1I+B7
	GajEcAzQq1zFA4PXBjrCnQ45pF09rltsaKgaegjE74KWXulZP9TdjI7baduyd+dkdjMyrDG48bKP0
	bfTE68rjyreRIl9KoBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRzPK-009Ww3-JU; Wed, 09 Mar 2022 16:43:26 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRa6j-004a2N-Sh
 for linux-i3c@lists.infradead.org; Tue, 08 Mar 2022 13:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646746953; x=1678282953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/CUWRbzy3p48e/BSuOUjvIJygGVfDRVjIJ7fX56alQU=;
 b=idoh2Fd7MF4JI8JJbLQIQlekZZ4loCZZtZmvZVPwQ+lhhtGLUpN1CX3n
 UVqbHaX/DE04UYUaUNbDyzU1jMBNMcV7IVTqxPZJnQW3b9JtwvQw1VOTu
 nxh469gLuCJqNcZK0y1NtnH/Nbs0cUZGH9FeF1Oo+1CNEqDDK2cBVCngf w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Mar 2022 05:42:31 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 05:42:31 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 8 Mar 2022 05:42:31 -0800
Received: from localhost (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Tue, 8 Mar 2022
 05:42:30 -0800
From: Jamie Iles <quic_jiles@quicinc.com>
To: <linux-i3c@lists.infradead.org>
CC: Jamie Iles <quic_jiles@quicinc.com>, kernel test robot <lkp@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] i3c: fix uninitialized variable use in i2c setup
Date: Tue, 8 Mar 2022 13:42:26 +0000
Message-ID: <20220308134226.1042367-1-quic_jiles@quicinc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_054233_995836_E28F97F1 
X-CRM114-Status: GOOD (  10.07  )
X-Mailman-Approved-At: Wed, 09 Mar 2022 08:32:06 -0800
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

97a82882d852 ("i3c: remove i2c board info from i2c_dev_desc") removed
the boardinfo from i2c_dev_desc to decouple device enumeration from
setup but did not correctly lookup the i2c_dev_desc to store the new
device, instead dereferencing an uninitialized variable.

Lookup the device that has already been registered by address to store
the i2c client device.

Fixes: 97a82882d852 ("i3c: remove i2c board info from i2c_dev_desc")
Reported-by: kernel test robot <lkp@intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>
---
 drivers/i3c/master.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index db0fa6887eef..f0bdecd7940f 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2318,8 +2318,13 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	 * We silently ignore failures here. The bus should keep working
 	 * correctly even if one or more i2c devices are not registered.
 	 */
-	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node)
+	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node) {
+		i2cdev = i3c_master_find_i2c_dev_by_addr(master,
+							 i2cboardinfo->base.addr);
+		if (WARN_ON(!i2cdev))
+			continue;
 		i2cdev->dev = i2c_new_client_device(adap, &i2cboardinfo->base);
+	}
 
 	return 0;
 }
-- 
2.32.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
