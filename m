Return-Path: <SRS0=3/jM=UV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F140C43613
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2019 20:55:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 406CC2084E
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2019 20:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LmvaVNly";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="Gs8iU+nb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="NvSuo10t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 406CC2084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUvs7Uid0K6u5CjrTrOaPQ2TAaqw3hmr7jViTu7FREU=; b=LmvaVNlygzZXYh
	72DsJYN/kZQavyXdIE2gZmXckDvbK1MUuSv3csaL8IAWkkn9EmCMrtzpMBRuwLd2WsAE2GdBC3Jg+
	cbyoBOkM5CBJDXTotWNNdfHZ/myLYOjeFUt0P7/nF1Y201tNWXFQRC+n9XrbV43UUTiRYcVsHtzUa
	4pWd56T4ojUW5EBML4LONW4LWk1QhOJiTzyHA09skNXYDYfcmpU53Fml4Fou+/SoPkZE6zRo4XJK8
	ABozRNMqZnYu55i5SxEsWBlLlYowl3Oo19MLowhkcQdToVJf4Wlh8KyyrBhuQ+cJMdkx8itMuHbpS
	IyNihaUdk18s6AAtIBuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hen3D-00078S-Q1; Sat, 22 Jun 2019 20:55:55 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hen3A-00077c-RQ
 for linux-i3c@lists.infradead.org; Sat, 22 Jun 2019 20:55:54 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5MKrVGj030829; Sat, 22 Jun 2019 13:55:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=GOkkQ904T8LJxcIUIA/JostJ6yyu+/XRCxTezFauf84=;
 b=Gs8iU+nbBbW5wwl+mRZ6/jT2lB7iMY820ArQtZYHmvl26isgQOIbmYd+a3eEh5S6GnDD
 BfpfGLHjF9BBdFHkfFPoSwnlwKqKhVL2jGjWy8NNTLMX1knvzS0MExqb4eu7r2IUjBZH
 scihDEoULZSEEtKqbiwVbJW0EH60eybwSnoUyeL2+MyoFyV8TqH2jc91jtsyBSONl8hL
 /qW/Qvc5D3tAaZ/V1DMMs86fDkq4noHpRk2PPl5u4i9WE1iR53J1lotZOjurtAKx+Ye4
 /7KwkqblwokXdCKcebpkhiUPzFTUeq/oGX0UwNhMvNip9WnVt/UXrdaaT/oQuwEjfBf/ Gg== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2055.outbound.protection.outlook.com [104.47.41.55])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2t9gvs1ce3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Jun 2019 13:55:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOkkQ904T8LJxcIUIA/JostJ6yyu+/XRCxTezFauf84=;
 b=NvSuo10tsrulaQrG5Ecq/XwUUfMQwraxryxKqkNu5dGqa806e2BrgFJWZtMeAF9/dCiGKVu8XBb0NDKBT0u1r0/QdLEpAaWZnK6xqv/uDHFVmTr2Ij75+j5cUwjiBZYrd0QTKIRG0M+L7dn4YYi12xUqhdEyEI1x4q4cGnMAJrM=
Received: from DM5PR07CA0045.namprd07.prod.outlook.com (2603:10b6:3:16::31) by
 BN3PR07MB2482.namprd07.prod.outlook.com (2a01:111:e400:7bbc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.13; Sat, 22 Jun
 2019 20:55:47 +0000
Received: from BY2NAM05FT050.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::208) by DM5PR07CA0045.outlook.office365.com
 (2603:10b6:3:16::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Sat, 22 Jun 2019 20:55:46 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BY2NAM05FT050.mail.protection.outlook.com (10.152.100.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.6 via Frontend Transport; Sat, 22 Jun 2019 20:55:46 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x5MKthIc004204
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sat, 22 Jun 2019 13:55:44 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sat, 22 Jun 2019 22:55:42 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sat, 22 Jun 2019 22:55:42 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x5MKtgWl009670;
 Sat, 22 Jun 2019 21:55:42 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x5MKtgcY009669;
 Sat, 22 Jun 2019 21:55:42 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v5 1/7] i3c: add addr and lvr to i2c_dev_desc structure
Date: Sat, 22 Jun 2019 21:54:59 +0100
Message-ID: <1561236905-8901-2-git-send-email-pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
References: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(376002)(346002)(2980300002)(199004)(36092001)(189003)(7636002)(186003)(4326008)(87636003)(446003)(5024004)(11346002)(47776003)(6916009)(26005)(50226002)(14444005)(2616005)(76176011)(86362001)(426003)(76130400001)(2351001)(246002)(5660300002)(50466002)(476003)(336012)(8676002)(42186006)(478600001)(16586007)(70206006)(107886003)(48376002)(126002)(8936002)(356004)(36756003)(2906002)(6666004)(316002)(70586007)(54906003)(305945005)(51416003)(486006)(26826003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR07MB2482; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34b6510e-1eff-4e7a-02a8-08d6f753ffbd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN3PR07MB2482; 
X-MS-TrafficTypeDiagnostic: BN3PR07MB2482:
X-Microsoft-Antispam-PRVS: <BN3PR07MB2482D782585DD020FC91019EC2E60@BN3PR07MB2482.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0076F48C8A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: RotHPt2DJUzYrj63goh70Dib38ZZgQTZbQOoCGbbbBE0VBfi1BEppC39pMYm6Tmamh9ENjXmd4qSMN0uV5a/v1EmHaZUqpjMhqs3iL/u8e+anFFARojSbx74Qp6syuefVPPoNj2gdTWlTz/0CdvFtPjYENOcykjZnUmcSE751J53YVXJWHMMr5mgtotbbPlns04Ks61No43fO7BlLpyGl3hof43F+JdKuMLZrWWoL9zl3r/SEvw/YEe8olZ9KdKOdd6HtpIbevRMOYWMET/gQNqNqnLb3MFqy2c2PeRODiGjKnE4nOul1GIRzcvDwQBt447s362evoJyv4D3EHH2ko77NBir3I/sBlbMaFT0Mi+pVJivjCXQzpRhKOlXae1UnV+2ND0aJqOjBVEW5rD2hUbl0XgIZdBmUKUSrJ8PzYw=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2019 20:55:46.3835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b6510e-1eff-4e7a-02a8-08d6f753ffbd
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR07MB2482
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-22_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=919 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906220190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190622_135552_998595_9F576131 
X-CRM114-Status: GOOD (  14.67  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, agolec@cadence.com,
 Przemyslaw Gaj <pgaj@cadence.com>, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

I need to store address and lvr value for I2C devices without static definition
in DT. This allows secondary master to transmit DEFSLVS command properly.

Main changes between v4 and v5:
- Change in defslvs to use addr and lvr from i2c_dev_desc structure
- Change in CDNS and DW drivers to use addr and lvr from i2c_dev_desc structure

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master.c                 | 10 ++++++----
 drivers/i3c/master/dw-i3c-master.c   |  4 ++--
 drivers/i3c/master/i3c-master-cdns.c |  4 ++--
 include/linux/i3c/master.h           |  5 +++++
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2f9a54d..0f7c31e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -620,6 +620,8 @@ i3c_master_alloc_i2c_dev(struct i3c_master_controller *master,
 
 	dev->common.master = master;
 	dev->boardinfo = boardinfo;
+	dev->addr = boardinfo->base.addr;
+	dev->lvr = boardinfo->lvr;
 
 	return dev;
 }
@@ -939,8 +941,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master)
 
 	desc = defslvs->slaves;
 	i3c_bus_for_each_i2cdev(bus, i2cdev) {
-		desc->lvr = i2cdev->boardinfo->lvr;
-		desc->static_addr = i2cdev->boardinfo->base.addr << 1;
+		desc->lvr = i2cdev->lvr;
+		desc->static_addr = i2cdev->addr << 1;
 		desc++;
 	}
 
@@ -1607,8 +1609,8 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
 				 common.node) {
 		i3c_master_detach_i2c_dev(i2cdev);
 		i3c_bus_set_addr_slot_status(&master->bus,
-					i2cdev->boardinfo->base.addr,
-					I3C_ADDR_SLOT_FREE);
+					     i2cdev->addr,
+					     I3C_ADDR_SLOT_FREE);
 		i3c_master_free_i2c_dev(i2cdev);
 	}
 }
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9934a12..22ac305 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1041,12 +1041,12 @@ static int dw_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
 		return -ENOMEM;
 
 	data->index = pos;
-	master->addrs[pos] = dev->boardinfo->base.addr;
+	master->addrs[pos] = dev->addr;
 	master->free_pos &= ~BIT(pos);
 	i2c_dev_set_master_data(dev, data);
 
 	writel(DEV_ADDR_TABLE_LEGACY_I2C_DEV |
-	       DEV_ADDR_TABLE_STATIC_ADDR(dev->boardinfo->base.addr),
+	       DEV_ADDR_TABLE_STATIC_ADDR(dev->addr),
 	       master->regs +
 	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
 
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 237f24a..5aee315 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1005,9 +1005,9 @@ static int cdns_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
 	master->free_rr_slots &= ~BIT(slot);
 	i2c_dev_set_master_data(dev, data);
 
-	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr),
+	writel(prepare_rr0_dev_address(dev->addr),
 	       master->regs + DEV_ID_RR0(data->id));
-	writel(dev->boardinfo->lvr, master->regs + DEV_ID_RR2(data->id));
+	writel(dev->lvr, master->regs + DEV_ID_RR2(data->id));
 	writel(readl(master->regs + DEVS_CTRL) |
 	       DEVS_CTRL_DEV_ACTIVE(data->id),
 	       master->regs + DEVS_CTRL);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index d480ab7..42bb215 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -71,6 +71,9 @@ struct i2c_dev_boardinfo {
  * @common: common part of the I2C device descriptor
  * @boardinfo: pointer to the boardinfo attached to this I2C device
  * @dev: I2C device object registered to the I2C framework
+ * @addr: I2C device address
+ * @lvr: LVR (Legacy Virtual Register) needed by the I3C core to know about
+ *	 the I2C device limitations
  *
  * Each I2C device connected on the bus will have an i2c_dev_desc.
  * This object is created by the core and later attached to the controller
@@ -84,6 +87,8 @@ struct i2c_dev_desc {
 	struct i3c_i2c_dev_desc common;
 	const struct i2c_dev_boardinfo *boardinfo;
 	struct i2c_client *dev;
+	u16 addr;
+	u8 lvr;
 };
 
 /**
-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
