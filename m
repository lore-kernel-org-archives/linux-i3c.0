Return-Path: <SRS0=lIk1=RN=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8DEC10F03
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Mar 2019 13:59:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA47C2086A
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Mar 2019 13:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MWwK1j8A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="tRJX3YWs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="j75r2JVj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA47C2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5m9ebf1vKOzkJJpuXB94L+EHcoCvhnjUS0NmbyUFCE=; b=MWwK1j8An9gyt7
	/n9CUNslbkf/hiz6rqloxhtUDnkgM+fz/MNxj2U3YmdFRl/3fxAXUrC0D/hD2pgzyzvhNTEhfWrsv
	+ugnf1C7MywnyksXGnXoc0P931pGuS+oalmBiKZUh/EEZjUGFc6wkR1gMhzlStAdUmzifiCq386dX
	d+DIm4LsBAHtGniD7+ixnHmHxaEzybo3z26Nyq4Zwk8gcOOWpWaTVKJOGBVDkbpS0Yszx9MboNr8G
	z2Yr24lme5Q9cmJU9UZLq+CrxHTYlpLiB93dFxdn/SO1IzTO+TO9ZiJxhcf0uW/5f/RcqjhUapjyl
	GDVyQK3SpFMU1ls28XpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2yzC-0002sl-7V; Sun, 10 Mar 2019 13:59:30 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2yz7-0002qQ-D9
 for linux-i3c@lists.infradead.org; Sun, 10 Mar 2019 13:59:28 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2ADsEGa025126; Sun, 10 Mar 2019 06:59:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=q+lAww5Wu2cvgrhOMhIAFeVf4KtpMpEM5aR9jBF8frE=;
 b=tRJX3YWs/hL4CwLcZSQPR7lhGb363UdJ3JngO2apMOptanwvlb7JagRM9SEoFZts/3Gp
 xZfiLciBLc9MZEECzPMcgMJrEzelRQMKsI1g2MhiFUH5sWQetALniZiIbbQiw1i1Zhuv
 MLve/7A4lgpmR1MCQdmPQFLSd3bxJyq7C7Om0XZUvuz9UzkK2Ooy60vW/Jm8YNA7PUfJ
 xWtZost5/oPlN5l0fhxAOK9c+TW+1OpC6+SSTm9pkJFF9++Mq4tqMWSAx5IMab7CmLQU
 VgO0TXA1+HsQmYKmyavjENxCgQSYiYs6YCslslqgeqA1qW4LuGOm+tfbjCYMQFgMQibu 2A== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-co1-obe.outbound.protection.outlook.com
 (mail-co1nam05lp2054.outbound.protection.outlook.com [104.47.48.54])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2r49y1cqy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Sun, 10 Mar 2019 06:59:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+lAww5Wu2cvgrhOMhIAFeVf4KtpMpEM5aR9jBF8frE=;
 b=j75r2JVjVIEJhpHaUJHFetkHkSfG2Ua4puxHqNj+TsCLVcmLHBI0QsAdWeOaR7wIzdl058k6WOfiRNDhorIixTNQfL7sW2uiz+mKlJ5fmwreVdzNiqXeY6BRk9v1RBBL0r46sh1fmdyrbdMDrKzauWi/Ryd56890ol+jg22dOpE=
Received: from SN4PR0701CA0006.namprd07.prod.outlook.com (10.161.192.144) by
 MN2PR07MB5920.namprd07.prod.outlook.com (20.179.81.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.18; Sun, 10 Mar 2019 13:59:13 +0000
Received: from BY2NAM05FT011.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::209) by SN4PR0701CA0006.outlook.office365.com
 (2603:10b6:803:28::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1686.18 via Frontend
 Transport; Sun, 10 Mar 2019 13:59:13 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BY2NAM05FT011.mail.protection.outlook.com (10.152.100.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1709.11 via Frontend Transport; Sun, 10 Mar 2019 13:59:13 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x2ADx9X0013509
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sun, 10 Mar 2019 06:59:11 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sun, 10 Mar 2019 14:59:08 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sun, 10 Mar 2019 14:59:08 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x2ADx7C8022495;
 Sun, 10 Mar 2019 13:59:07 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x2ADx7xp022493;
 Sun, 10 Mar 2019 13:59:07 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 1/6] i3c: add addr and lvr to i2c_dev_desc structure
Date: Sun, 10 Mar 2019 13:58:38 +0000
Message-ID: <20190310135843.21154-2-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190310135843.21154-1-pgaj@cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(39860400002)(376002)(2980300002)(36092001)(189003)(199004)(50466002)(42186006)(8676002)(107886003)(51416003)(26005)(86362001)(305945005)(6916009)(54906003)(16586007)(356004)(316002)(106466001)(246002)(105596002)(186003)(2351001)(4326008)(76176011)(47776003)(8936002)(50226002)(126002)(476003)(486006)(2616005)(426003)(5024004)(7636002)(87636003)(6666004)(446003)(48376002)(11346002)(478600001)(26826003)(336012)(2906002)(5660300002)(1076003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR07MB5920; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f7aced5-9d6b-4606-f660-08d6a56093a4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:MN2PR07MB5920; 
X-MS-TrafficTypeDiagnostic: MN2PR07MB5920:
X-Microsoft-Exchange-Diagnostics: 1; MN2PR07MB5920;
 20:Wj52bhIOLvuO4ZQfIvGIf7UZLzlzc1yBifRca8+7p3Htoru3t3f9ShM43z7CbWvbsQCGVMD/P0WmEoT6anGTahNIXZyoeMUbJaBl41pVq71nUqa/MdoyCEim8ekONPzsuMP6rJTSjER6+lD5zSg7y5WvwN0fIY2dnjlagQ6iB/KugslVhVAuXbEXaEeDOZyN25q0vAntZQgyhJZ5Au+aTVV6s1yy5LXSPH2IfisPenxqmeHVhYH/4CK0rAM0Vys+5B6VAzarRZmU1YUU6cM7njva9jP3xBmqlzuZvUgtqMlVvyRQxxmebpVFoozAfBcQku2VF4R6PHkfooIznxQlL59cS3S2jF4k7i6Fcm103gRvjv3yxhVsIv9RpSY3LX73wBDARXKtmseaBAlqanzYbSaL4lQaPwxfGSJJgifJb3rtrYnnJdtDadC1CWbN/1ipI3nM4fhylf6yXBRWu7w7GV6aOQIL5+yui/iBL9xOgEuySlXckXRolc/k5QOkgrL3
X-Microsoft-Antispam-PRVS: <MN2PR07MB592051F44BDAFB473BE93CAEC24F0@MN2PR07MB5920.namprd07.prod.outlook.com>
X-Forefront-PRVS: 0972DEC1D9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MN2PR07MB5920;
 23:a0eiC+NC4tfbBjIVL5SOVuBSLoYpYEGkAN9BuwA6J?=
 =?us-ascii?Q?EAwIylcFoNfO+w69zmHW+18ZKi7DAR18tvMJx1JOyMhjCgV692AhuETQQQwe?=
 =?us-ascii?Q?NMHW+Ig+qoC+UNZdW/n5XcQzv6LrG2U9kvXS5UwPOiO/+Gzw+Wloh34jFMRI?=
 =?us-ascii?Q?bW8oay1wVxf15E3DPM0aXuaKrVxDQqYgq+IZNZHXteOOIBof6AFLCW8MZ4Gj?=
 =?us-ascii?Q?Te6tSFfz3zFAYyjeBbk65YbLi3qc8PIIEUwgi2pqOCdcwYp04ekkl/0g1CJN?=
 =?us-ascii?Q?grEgKb1kPq6HUq1uHpt6tDKiuVBE+QFK16fatpXqxybks5OtlPQKjmyQnuF4?=
 =?us-ascii?Q?Qfbh+YujHs4QOZ4RbFclxmGR6zx/GP8CTU3FiRdvArytQa2YgCdB3Nd7r84C?=
 =?us-ascii?Q?VI3srJaAgG4BdMm0flPYxlkAVxlkCo1pljFWdzMx1c7Qj2BZecX6G53PEfPh?=
 =?us-ascii?Q?NRnrXZNQKHm2B0V4SlTGoFtEkpCM5zkmnz6qMlDxiyZO6q5o6qY4MHf2ZXX0?=
 =?us-ascii?Q?U07d2OBofNGLBGwpego5apG/oyjgq/xzbUa9Xsy7C0/G23MzC/t3gmst7n4t?=
 =?us-ascii?Q?mKAPptB+rYl4xGLNCekBOh9hZw8PHVkeswB2GqW+QlvkkNddP6Q+BplnbpWY?=
 =?us-ascii?Q?Rr/7qypNWQgnD2l1EvyfMGpJTHJme9CvnclD8+IPcPt+gXR1EFSs2ISFXWcc?=
 =?us-ascii?Q?n2advxwjxwAgpu4QvJrzuHgvMTHh4fp6KNj8XOVCEE3U6bP1yWP8CEjWYpFM?=
 =?us-ascii?Q?+GRaAtMAZzBssKAZW5Ae5Mx+1XYzWUafLKlNYvhMzp2dhVTT3QnRzuK0q4JP?=
 =?us-ascii?Q?LnhC0wAnli4htfgIr50YpTE9/YyGonzsK5J8kczitMb1YCFJkk997830UPuZ?=
 =?us-ascii?Q?9SHL9AgilHFfzaIr2AliXC5H9C/IwiccxRQWr2Kn3KROUQyjWgUwcMyi+nBx?=
 =?us-ascii?Q?WgpFsB18LPcsEA/JROLswHYWBHCM5NAIAh2giBOtfuNwXXBFOmyYk2XtJfSw?=
 =?us-ascii?Q?J0XPJ1Fr/CHUK74BO8S+lZ8fAc1hSvdn7xRnDG5Fxs3gBMlcOXIpaQLyZrN8?=
 =?us-ascii?Q?NdOtj3TnKMyAOcZgDPeFUVO9/hD2L0frlxCv3gubANDMBXbilf07sTNLiirZ?=
 =?us-ascii?Q?zmLUV/FUJA=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: wq9tSCKz+UZA2RvBiC8++fHBuTxQZo46AKH75fSVksgnaVBUQ39tbc9W2lwdvItD2dduGTbUw0phXrfqd20Lo+7dUpnX2CDXGHjBrFsw2n4q2zIjewU1loPc4w4jnxcbL+p3FfP116zrT4d1doj6KDKwi5t6t5UsfEN12uwBLrxdOdU7bRkvJU+VwoFKFay1b4UvodHm68ufSGso0WsaRvSESlGEcvQ6xWNEUmIx0byOQ+cHQox4IqamSyBTeLUJUZbWVTEzFXeEpTGqHOSzscdJ5G4s+Wp9MDvpp43Kajsqbr/EJCFIZu2jqrGWSrvWLZMuegfQMeOH49ugR+B+uQvGpX1gIAGSUh9XwiZmi48UNXaRLHdYS0sZK1PMOuq6g0WD84N42YAK8YIAcpruL9b4jcaOO0ewvAsjUEQETlw=
X-Microsoft-Exchange-Diagnostics: 1; MN2PR07MB5920;
 20:RpbrmGRAPOjF6NaCuo93I+uunDoFzJVQDRU6Lrer3rH94qz+M1t/Y9erCi/5mbdy819llsL61RuJf0qxq41Nyzjg4WQZBYmHOsvGwfPUbWcU1RSG1ZDrx8/qHd0mmbZ3KBHoRlH0YQy4MpI64dupfwb0cz6F8TF5WJeenQ+DSMY+2FBlvnV6/VJuvxBl80pBMaJehg7+8sk3RLPpcgZHGiGfvpUcSJEmH5GCKV+WJLfyaOJZtMKL8VS4EfYUOw7j
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2019 13:59:13.1388 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7aced5-9d6b-4606-f660-08d6a56093a4
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB5920
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-10_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=915 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903100109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190310_065925_698890_A64DB026 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: linux-i3c@lists.infradead.org, agolec@cadence.com,
 Przemyslaw Gaj <pgaj@cadence.com>, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

I need to store address and lvr value for I2C devices without static definition
in DT. This allows secondary master to transmit DEFSLVS command properly.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 include/linux/i3c/master.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index eca8337..3c27d9f 100644
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
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
