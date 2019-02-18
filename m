Return-Path: <SRS0=nyfO=QZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82954C10F02
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Feb 2019 13:13:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51D58218AD
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Feb 2019 13:13:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lwAJvu4m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="N2YV6w3g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="gOuAU6ew"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51D58218AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEGPmixGLronDUdP3UbPbI+uX+2YHmJi1jJbfqGzems=; b=lwAJvu4mJWQuSo
	lt97l/Iw98JBE+KWCEdb9sUUuPm5rZawFne0X0xQPwHai4YITBUwH6d+LbZCiDX3hcqlkyDnIKAYc
	bNtukeVXUTFtQs7Z2rfg0vpMDpycVpgbpWXF7ScXjhh2DMZhSkrgBZaYlrmNZ7Sl0v3swkMsgyvC/
	7WXHKKZaIkuCfiXEz+QdTW11ux0qUfnIy6h3JhIz3yq9UePxVp9K/3sqg9ChIMmwQGZkay90YYCWM
	AC4q+FovyMpQcPzB3hgBNNLVbXmbJlgsC+EDtWaeGuLTlc5uj0SdCkI1LIJEXvNpy7mqjDTq25DFr
	iHtha1YYGyPR7GYEMotw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvijP-0001ak-T8; Mon, 18 Feb 2019 13:13:11 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvijL-0001YK-9s
 for linux-i3c@lists.infradead.org; Mon, 18 Feb 2019 13:13:11 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1ID49PG008343; Mon, 18 Feb 2019 05:13:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=VFSawIgDJ5sTELEtZ/xrGVNt+RxZ8M0O+h8BHjTH9P8=;
 b=N2YV6w3gutEtxswfphXKwUv0IavXAplKnT3UyzyGz4kvU1RdTjcHIBGBXdq0eojaZn6a
 JpqA7h3nNkGqsRBTV5jeOYFjBgWRcehRer/684YHuW0wCB5I6Cc3smvwqp7r4vRO0jBM
 QSK0Dkvf/qsVoV9yz5g5DtQk93ufW3GVS33P8xoIiOjDYC+2kcVhAKZV0uDf8NT6Fz/4
 tyiKI23sFnFJQ3J2lfrvUyaX+yVttDw7U7QjGKeShGGef9aTVCCbXm0xKR6OCytr1bz7
 bBk3Eq+tubHnndo0obkizKPSRnu/7dVAa9pa2DkOAiE6lQJ2Ze6xuGFMZIMY9y20KGxY FQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-by2-obe.outbound.protection.outlook.com
 (mail-by2nam03lp2059.outbound.protection.outlook.com [104.47.42.59])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qpeyy8u9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 18 Feb 2019 05:13:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFSawIgDJ5sTELEtZ/xrGVNt+RxZ8M0O+h8BHjTH9P8=;
 b=gOuAU6ew/unSQvZQrDySy9pZv4bxUr+iINK/VgwMSahHGA7OEU3rgDTUHpb08sRzDNbJQX/PBCK4FCLkQPb2RMXOxHi50JOE/lWUyqAaoEfXDHbFYabhuhWAekNyT3Yg9EGp/BuofzmRtwcUKK/bujPPDvfcUiDOB3GGT9xAk/8=
Received: from DM5PR07CA0036.namprd07.prod.outlook.com (2603:10b6:3:16::22) by
 DM3PR07MB2251.namprd07.prod.outlook.com (2a01:111:e400:c460::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.18; Mon, 18 Feb
 2019 13:13:00 +0000
Received: from BY2NAM05FT025.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::202) by DM5PR07CA0036.outlook.office365.com
 (2603:10b6:3:16::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.16 via Frontend
 Transport; Mon, 18 Feb 2019 13:13:00 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BY2NAM05FT025.mail.protection.outlook.com (10.152.100.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.11 via Frontend Transport; Mon, 18 Feb 2019 13:12:59 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1IDCuZ7019867
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 18 Feb 2019 05:12:59 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 18 Feb 2019 14:12:52 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 18 Feb 2019 14:12:52 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1IDCq6o001046;
 Mon, 18 Feb 2019 13:12:52 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1IDCqkQ001035;
 Mon, 18 Feb 2019 13:12:52 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 2/4] i3c: master: cdns: add support for mastership request to
 Cadence I3C master driver.
Date: Mon, 18 Feb 2019 13:08:44 +0000
Message-ID: <20190218130846.19939-3-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190218130846.19939-1-pgaj@cadence.com>
References: <20190218130846.19939-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(346002)(136003)(2980300002)(36092001)(189003)(199004)(246002)(8676002)(186003)(446003)(426003)(5660300002)(50226002)(305945005)(336012)(11346002)(26005)(476003)(2616005)(486006)(50466002)(7636002)(8936002)(4326008)(48376002)(107886003)(126002)(36756003)(105596002)(2906002)(356004)(6666004)(2351001)(106466001)(26826003)(6916009)(87636003)(1076003)(16586007)(54906003)(86362001)(51416003)(316002)(14444005)(47776003)(76176011)(42186006)(30864003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM3PR07MB2251; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46c7c40f-80a2-4778-97ec-08d695a2ce78
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060);
 SRVR:DM3PR07MB2251; 
X-MS-TrafficTypeDiagnostic: DM3PR07MB2251:
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2251;
 20:8kdlWeXUWCQQq+u10RCOkIwk/KDnbbdHK2LYcWns5Hs5IQdXojRO6O55nLrLjpnODVaSw5tk0MTD/UbVzaP6gX7OjRPbjlD9k8Eu5jcq3998MIxGTOuM+b/9btlf8YsY1VSzr1au6pJ3/5Fukd4++9bx61FYue2GvksjMBEJ76vCQ1bB4dTxn0XHl72cE9J8431ddGZhSggoZp1bNWAns3qEPZZEwvP+UyBXKxoFGo4OJgLcW2jdG3Uy8WL7OuUmnnPOJnJWBYqXMaKh5r7PAvY69KsXBDykgb7x/secbFg/AGSc6Rq8eJiD/P+Pqp1iJmOJSPK4CNUjBj9LDmt+40hruKbdY3EXdfjM1DJeJukgzdpTzNpP9VgXWeFCIampKCcRuEDc739qMiBElwruab0a2MfF5uJe4yprcTWtrGmwszcp4XO9nJLkG5uNiiLRcgB0HooPpwZfY6oONBWTiV6W45WVGs0QfY7acObGdeNOkowLBE3dSFPZcP9lDuxp
X-Microsoft-Antispam-PRVS: <DM3PR07MB225102CDF340114E0F05A2CDC2630@DM3PR07MB2251.namprd07.prod.outlook.com>
X-Forefront-PRVS: 09525C61DB
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM3PR07MB2251;
 23:k958hq0gpJkZ246CvSwUfDM5iwJF35yJXyv3zRZ3B?=
 =?us-ascii?Q?NK6aCk0MDVWXGeXIRUYQj8SE7iXaQAufR7YjZqnhrGxeIwpFScnvDx0tLoiW?=
 =?us-ascii?Q?Rv+wJ5qb30gIJvkcnt9SKPBvIMtZ+/s0F/EhJMw2tsTnzzPOyAHGaKarEHEx?=
 =?us-ascii?Q?5oSxbousmauSD4g4PHVWI8PVeKC4tRSqH5Y63zmtE48k+z9ip83mSF37vrV1?=
 =?us-ascii?Q?L4Ra/Y40/SMCHcN9sQ8hgI5VH0cXFfZmOMM4k4U1h0Pkb1NzPl9YXvs19lON?=
 =?us-ascii?Q?7Gf7S7oYehEFAKM4EM/yBeEEUFPUwpBh0RUgJD6+LgO4eT2Gm1DJ6heJgBuy?=
 =?us-ascii?Q?FThM56sed8NLuUI6WwdlWbqc2Mgy5++m3GIoyHZmupgtgZ7LJuZKFZS8+BDE?=
 =?us-ascii?Q?mjZudsKYJok9JKJYTUaAcTRz5cbWZQphxB5g0EvepEPGhmpLfKtFsgwezW8B?=
 =?us-ascii?Q?MMwYoLjs49zQzsS5ravh/+TVmtxfBJXhgek298e75JZIfGk0eM59ddLPiR+j?=
 =?us-ascii?Q?ZWwwRcnPZdTeMoiEfeAEGpTIZEomK0SJGBjmqCrTjY4yQ9scYf++PIFbnYCy?=
 =?us-ascii?Q?FYG9BtFepHviq49NtaIgcdSaYB2tCHL6iIHiwofs3lLFy2B3Pc7dgze6iS0W?=
 =?us-ascii?Q?MJMDhwJ8hAWzsFNewEcSm23lplkKSovYxoUg4HjY8rOdIrHzGaz/WY5vigdS?=
 =?us-ascii?Q?E3sJXfyVwGaBX7QUfEsl7mJawux1JkNaMfHovZ4SiMP6fPyHbZzU+VV0vuq5?=
 =?us-ascii?Q?9RWf0YvDSAnHBg4VSYR72TQfH+gdkICcIbJUjIP5td7MdEQszcV0z81EyHVF?=
 =?us-ascii?Q?fEdLj4oBqv2qI3oCPc+qVjFR3mi1HQHIFm0zaKkKddqWpeAkKBBkak4M92Hk?=
 =?us-ascii?Q?QkVScNKJv7+yNg4M6DiA/avfHkrO/rtk68UYrdh25zL0/H1wFo5Vg+TOOxmy?=
 =?us-ascii?Q?lg1lBFHD1bSSjrs4yJn5aw2zWv7YKrSNROH+Jd14939JY+Kd5sMyUcn9/GuV?=
 =?us-ascii?Q?GE2+TWgxx8X1257BuBSj+BaMrvBH7OssJOTa2tBpqBLj7PtbbMtUCt590RtH?=
 =?us-ascii?Q?TZQ0ynRptFlUbzPnGgfwhrMER/61+U7eVILmN/zEO8Dn0KTpneNWr52DMbIr?=
 =?us-ascii?Q?nETIlf9Z9nl8c43+eheMG0aio/+GIpT?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /SWH63FyoFNXuTvFrhrSsyQ9CucC94hWSdQEHYVfOzY+VvkdSaMGi/jaJvABySpUpBfXaHSN3Kjc9NebJNxun2U7cNU7obbyG5SQmCiUDIXo1EDmGu37maDRtL5snjO1+1Z6tHGUHwFxhFfyY8sDsl4DWktelzhQA/mNanyZy8orraUstIzHlGjJRas4xXd8T1eVNeNAqiz4rQcWfB4ESOe8K+2NdzfM6N/ZBIKLCE/C6Sv6buAj8jPXK+vWQlIgCMIw0a/3I8QNvc5a47ZVGtrZN4yURixDa1j4ZMdrsJb6evya2UIjl+AbR4r06k34TGO5bUy/7A9cLsu7LOZizCHwiDWrHBBoqln+hyQ/udg9JBd3ozWP8JFVuhY9527HP8D//g63uEhVztujQJnkJj4nuROtkeKV0E8yzzyG33E=
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2251;
 20:tqb0kjlSVdAaHMVZGivLmFoeX2EOK3BV2+9HTn/EBxepHPYV7fzhvuQwHS5EQLFVAb2r0VlDzt9tixbT9x9Z02OOh3Jm14JMDuGLzYIG7yfgIpJEHojLyXpfWjSUA5iyK1J0KbD1Uny0v/6OHToaF2+5ugQ/LSYwIQsLDnVfHB8Q5m7kLX97/gYgQMJped+FZVPXUUQ2lx9bh9jAeSRuMTBm5KU7cHKoL+EdvyLzZrDhEJ5w/1j5FVj7f/b1/KsY
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2019 13:12:59.9943 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c7c40f-80a2-4778-97ec-08d695a2ce78
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR07MB2251
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-18_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_051307_729380_6CA24561 
X-CRM114-Status: GOOD (  15.38  )
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
Cc: linux-i3c@lists.infradead.org, Przemyslaw Gaj <pgaj@cadence.com>,
 rafalc@cadence.com, vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch adds support for mastership request to Cadence I3C master driver.

Mastership is requested automatically after secondary master receives
mastership ENEC event. This allows secondary masters to initialize their bus.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

Main changes between v2 and v3:
- Add mastership type
- Add postponed master registration
- Add update device definition on bus initialization time
- Removed redundant mastership work structs
- Reworked IBI slot lookup
- Reworked Mastership event enabling/disabling

Changes in v2:
- Add work structs for mastership purpose
- Add missing mastership disable feature
---
 drivers/i3c/master/i3c-master-cdns.c | 493 +++++++++++++++++++++++++++++++----
 1 file changed, 442 insertions(+), 51 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 8889a4f..de4c4ad 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -157,6 +157,7 @@
 #define SLV_IMR				0x48
 #define SLV_ICR				0x4c
 #define SLV_ISR				0x50
+#define SLV_INT_DEFSLVS			BIT(21)
 #define SLV_INT_TM			BIT(20)
 #define SLV_INT_ERROR			BIT(19)
 #define SLV_INT_EVENT_UP		BIT(18)
@@ -388,8 +389,19 @@ struct cdns_i3c_xfer {
 	struct cdns_i3c_cmd cmds[0];
 };
 
+enum cdns_i3c_mr {
+	REQUEST,
+	HANDOFF,
+	TAKEOVER
+};
+
 struct cdns_i3c_master {
 	struct work_struct hj_work;
+	struct {
+		struct work_struct work;
+		enum cdns_i3c_mr mr_type;
+		u32 ibir;
+	} mastership;
 	struct i3c_master_controller base;
 	u32 free_rr_slots;
 	unsigned int maxdevs;
@@ -408,6 +420,8 @@ struct cdns_i3c_master {
 	struct clk *pclk;
 	struct cdns_i3c_master_caps caps;
 	unsigned long i3c_scl_lim;
+	struct device *parent;
+	struct workqueue_struct *wq;
 };
 
 static inline struct cdns_i3c_master *
@@ -663,6 +677,88 @@ static void cdns_i3c_master_unqueue_xfer(struct cdns_i3c_master *master,
 	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
 }
 
+static void
+cdns_i3c_master_i3c_dev_rr_to_info(struct cdns_i3c_master *master,
+				   unsigned int slot,
+				   struct i3c_device_info *info)
+{
+	u32 rr;
+
+	memset(info, 0, sizeof(*info));
+	rr = readl(master->regs + DEV_ID_RR0(slot));
+	info->dyn_addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
+	rr = readl(master->regs + DEV_ID_RR2(slot));
+	info->dcr = rr;
+	info->bcr = rr >> 8;
+	info->pid = rr >> 16;
+	info->pid |= (u64)readl(master->regs + DEV_ID_RR1(slot)) << 16;
+}
+
+static void
+cdns_i3c_master_i2c_dev_rr_to_info(struct cdns_i3c_master *master,
+				   unsigned int slot,
+				   u16 *addr, u8 *lvr)
+{
+	u32 rr;
+
+	rr = readl(master->regs + DEV_ID_RR0(slot));
+	*addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
+	rr = readl(master->regs + DEV_ID_RR2(slot));
+	*lvr = rr;
+}
+
+static
+int cdns_i3c_sec_master_request_mastership(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	u32 status;
+	int ret;
+
+	status = readl(master->regs + MST_STATUS0);
+	if (WARN_ON(status & MST_STATUS0_MASTER_MODE))
+		return -EEXIST;
+
+	status = readl(master->regs + SLV_STATUS1);
+	if (status & SLV_STATUS1_MR_DIS)
+		return -EACCES;
+
+	writel(SLV_INT_MR_DONE, master->regs + SLV_IER);
+	writel(readl(master->regs + CTRL) | CTRL_MST_INIT | CTRL_MST_ACK,
+	       master->regs + CTRL);
+
+	ret = readl_poll_timeout(master->regs + MST_STATUS0, status,
+				 status & MST_STATUS0_MASTER_MODE, 100,
+				 100000);
+	return ret;
+}
+
+static void cdns_i3c_master_update_devs(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	u32 val, newdevs;
+	u16 addr;
+	u8 lvr;
+	int slot;
+	struct i3c_device_info i3c_info;
+
+	newdevs = readl(master->regs + DEVS_CTRL) & DEVS_CTRL_DEVS_ACTIVE_MASK;
+	for (slot = 1; slot <= master->maxdevs; slot++) {
+		val = readl(master->regs + DEV_ID_RR0(slot));
+
+		if ((newdevs & BIT(slot)) && (val & DEV_ID_RR0_IS_I3C)) {
+			cdns_i3c_master_i3c_dev_rr_to_info(master, slot,
+							   &i3c_info);
+
+			i3c_master_add_i3c_dev_locked(m, i3c_info.dyn_addr);
+		} else if ((newdevs & BIT(slot)) &&
+			   !(val & DEV_ID_RR0_IS_I3C)) {
+			cdns_i3c_master_i2c_dev_rr_to_info(master, slot,
+							   &addr, &lvr);
+			i3c_master_add_i2c_dev(m, addr, lvr);
+		}
+	}
+}
+
 static enum i3c_error_code cdns_i3c_cmd_get_err(struct cdns_i3c_cmd *cmd)
 {
 	switch (cmd->error) {
@@ -1044,22 +1140,6 @@ static void cdns_i3c_master_bus_cleanup(struct i3c_master_controller *m)
 	cdns_i3c_master_disable(master);
 }
 
-static void cdns_i3c_master_dev_rr_to_info(struct cdns_i3c_master *master,
-					   unsigned int slot,
-					   struct i3c_device_info *info)
-{
-	u32 rr;
-
-	memset(info, 0, sizeof(*info));
-	rr = readl(master->regs + DEV_ID_RR0(slot));
-	info->dyn_addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
-	rr = readl(master->regs + DEV_ID_RR2(slot));
-	info->dcr = rr;
-	info->bcr = rr >> 8;
-	info->pid = rr >> 16;
-	info->pid |= (u64)readl(master->regs + DEV_ID_RR1(slot)) << 16;
-}
-
 static void cdns_i3c_master_upd_i3c_scl_lim(struct cdns_i3c_master *master)
 {
 	struct i3c_master_controller *m = &master->base;
@@ -1187,10 +1267,6 @@ static int cdns_i3c_master_do_daa(struct i3c_master_controller *m)
 
 	cdns_i3c_master_upd_i3c_scl_lim(master);
 
-	/* Unmask Hot-Join and Mastership request interrupts. */
-	i3c_master_enec_locked(m, I3C_BROADCAST_ADDR,
-			       I3C_CCC_EVENT_HJ | I3C_CCC_EVENT_MR);
-
 	return 0;
 }
 
@@ -1254,15 +1330,17 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 	prescl1 = PRESCL_CTRL1_OD_LOW(ncycles);
 	writel(prescl1, master->regs + PRESCL_CTRL1);
 
-	/* Get an address for the master. */
-	ret = i3c_master_get_free_addr(m, 0);
-	if (ret < 0)
-		return ret;
+	if (!m->secondary) {
+		/* Get an address for the master. */
+		ret = i3c_master_get_free_addr(m, 0);
+		if (ret < 0)
+			return ret;
 
-	writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
-	       master->regs + DEV_ID_RR0(0));
+		writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
+		       master->regs + DEV_ID_RR0(0));
+	}
 
-	cdns_i3c_master_dev_rr_to_info(master, 0, &info);
+	cdns_i3c_master_i3c_dev_rr_to_info(master, 0, &info);
 	if (info.bcr & I3C_BCR_HDR_CAP)
 		info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
 
@@ -1281,9 +1359,32 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 
 	cdns_i3c_master_enable(master);
 
+	if (m->secondary) {
+		i3c_bus_maintenance_lock(&master->base.bus);
+		cdns_i3c_master_update_devs(&master->base);
+		i3c_bus_maintenance_unlock(&master->base.bus);
+	}
+
 	return 0;
 }
 
+static
+struct i3c_dev_desc *cdns_i3c_get_ibi_device(struct cdns_i3c_master *master,
+					     u32 ibir)
+{
+	struct i3c_dev_desc *dev;
+	u32 id = IBIR_SLVID(ibir);
+
+	if (id >= master->ibi.num_slots || (ibir & IBIR_ERROR))
+		return NULL;
+
+	dev = master->ibi.slots[id];
+	if (!dev)
+		return NULL;
+
+	return dev;
+}
+
 static void cdns_i3c_master_handle_ibi(struct cdns_i3c_master *master,
 				       u32 ibir)
 {
@@ -1361,27 +1462,100 @@ static void cnds_i3c_master_demux_ibis(struct cdns_i3c_master *master)
 
 		case IBIR_TYPE_MR:
 			WARN_ON(IBIR_XFER_BYTES(ibir) || (ibir & IBIR_ERROR));
+			master->mastership.ibir = ibir;
+			master->mastership.mr_type = HANDOFF;
+			queue_work(master->base.wq,
+				   &master->mastership.work);
+			break;
 		default:
 			break;
 		}
 	}
 }
 
+static void cdns_i3c_master_bus_handoff(struct cdns_i3c_master *master)
+{
+	struct i3c_dev_desc *dev;
+
+	dev = cdns_i3c_get_ibi_device(master, master->mastership.ibir);
+
+	writel(MST_INT_MR_DONE, master->regs + MST_ICR);
+
+	master->base.bus.cur_master = dev;
+}
+
+static void cdns_i3c_master_mastership_takeover(struct cdns_i3c_master *master)
+{
+	if (master->base.init_done) {
+		i3c_bus_maintenance_lock(&master->base.bus);
+		cdns_i3c_master_update_devs(&master->base);
+		i3c_bus_maintenance_unlock(&master->base.bus);
+
+		i3c_master_bus_takeover(&master->base);
+	}
+
+	writel(readl(master->regs + CTRL) & ~CTRL_MST_ACK, master->regs + CTRL);
+}
+
+static void cdns_i3c_sec_master_event_up(struct cdns_i3c_master *master)
+{
+	u32 status;
+
+	writel(SLV_INT_EVENT_UP, master->regs + SLV_ICR);
+	status = readl(master->regs + SLV_STATUS1);
+	if (!(status & SLV_STATUS1_MR_DIS) &&
+	    !master->base.this) {
+		master->mastership.mr_type = REQUEST;
+		queue_work(master->wq, &master->mastership.work);
+	}
+}
+
+static void cdns_i3c_sec_mastership_done(struct cdns_i3c_master *master)
+{
+	writel(SLV_INT_MR_DONE, master->regs + SLV_ICR);
+
+	master->base.bus.cur_master = master->base.this;
+
+	if (master->base.this) {
+		master->mastership.mr_type = TAKEOVER;
+		queue_work(master->base.wq, &master->mastership.work);
+	}
+}
+
 static irqreturn_t cdns_i3c_master_interrupt(int irq, void *data)
 {
 	struct cdns_i3c_master *master = data;
 	u32 status;
 
-	status = readl(master->regs + MST_ISR);
-	if (!(status & readl(master->regs + MST_IMR)))
-		return IRQ_NONE;
+	status = readl(master->regs + MST_STATUS0);
+
+	if (!master->base.this ||
+	    master->base.this != master->base.bus.cur_master) {
+		status = readl(master->regs + SLV_ISR);
+
+		if (!(status & readl(master->regs + SLV_IMR)))
+			return IRQ_NONE;
+
+		if (status & SLV_INT_MR_DONE)
+			cdns_i3c_sec_mastership_done(master);
+
+		if (status & SLV_INT_EVENT_UP)
+			cdns_i3c_sec_master_event_up(master);
+	} else {
+		status = readl(master->regs + MST_ISR);
+		if (!(status & readl(master->regs + MST_IMR)))
+			return IRQ_NONE;
+
+		spin_lock(&master->xferqueue.lock);
+		cdns_i3c_master_end_xfer_locked(master, status);
+		spin_unlock(&master->xferqueue.lock);
 
-	spin_lock(&master->xferqueue.lock);
-	cdns_i3c_master_end_xfer_locked(master, status);
-	spin_unlock(&master->xferqueue.lock);
+		if (status & MST_INT_IBIR_THR)
+			cnds_i3c_master_demux_ibis(master);
 
-	if (status & MST_INT_IBIR_THR)
-		cnds_i3c_master_demux_ibis(master);
+		if (status & MST_INT_MR_DONE)
+			cdns_i3c_master_bus_handoff(master);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -1450,30 +1624,54 @@ static int cdns_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
 	return ret;
 }
 
-static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
-				       const struct i3c_ibi_setup *req)
+static int cdns_i3c_master_find_ibi_slot(struct cdns_i3c_master *master,
+					 struct i3c_dev_desc *dev,
+					 s16 *slot)
 {
-	struct i3c_master_controller *m = i3c_dev_get_master(dev);
-	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
-	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	unsigned long flags;
 	unsigned int i;
-
-	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
-	if (IS_ERR(data->ibi_pool))
-		return PTR_ERR(data->ibi_pool);
+	int ret = -ENOENT;
 
 	spin_lock_irqsave(&master->ibi.lock, flags);
 	for (i = 0; i < master->ibi.num_slots; i++) {
-		if (!master->ibi.slots[i]) {
-			data->ibi = i;
-			master->ibi.slots[i] = dev;
+		/*
+		 * We only need 'SIR' slots to describe IBI-capable devices.
+		 * This slot may be used by mastership request interrupt,
+		 * We can ruse the same 'SIR' map entry.
+		 */
+		if (master->ibi.slots[i] == dev) {
+			*slot = i;
+			ret = 0;
 			break;
 		}
 	}
+
+	if (ret)
+		for (i = 0; i < master->ibi.num_slots; i++) {
+			if (!master->ibi.slots[i]) {
+				master->ibi.slots[i] = dev;
+				*slot = i;
+				ret = 0;
+				break;
+			}
+		}
 	spin_unlock_irqrestore(&master->ibi.lock, flags);
 
-	if (i < master->ibi.num_slots)
+	return ret;
+}
+
+static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
+				       const struct i3c_ibi_setup *req)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+
+	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
+	if (IS_ERR(data->ibi_pool))
+		return PTR_ERR(data->ibi_pool);
+
+	if (cdns_i3c_master_find_ibi_slot(master, dev, &data->ibi) == 0)
 		return 0;
 
 	i3c_generic_ibi_free_pool(data->ibi_pool);
@@ -1482,6 +1680,51 @@ static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
 	return -ENOSPC;
 }
 
+static int
+cdns_i3c_master_enable_mastership_events(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	struct cdns_i3c_i2c_dev_data *data;
+	struct i3c_dev_desc *i3cdev;
+	unsigned long flags;
+	u32 sircfg, sirmap;
+	int ret;
+
+	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
+		if (I3C_BCR_DEVICE_ROLE(i3cdev->info.bcr) != I3C_BCR_I3C_MASTER)
+			continue;
+
+		data = i3c_dev_get_master_data(i3cdev);
+		if (!data)
+			continue;
+
+		ret = cdns_i3c_master_find_ibi_slot(master, i3cdev, &data->ibi);
+		if (ret)
+			continue;
+
+		spin_lock_irqsave(&master->ibi.lock, flags);
+		sirmap = readl(master->regs + SIR_MAP_DEV_REG(data->ibi));
+		sirmap &= ~SIR_MAP_DEV_CONF_MASK(data->ibi);
+		sircfg = SIR_MAP_DEV_ROLE(i3cdev->info.bcr >> 6) |
+			SIR_MAP_DEV_DA(i3cdev->info.dyn_addr) |
+			SIR_MAP_DEV_PL(i3cdev->info.max_ibi_len) |
+			SIR_MAP_DEV_ACK;
+
+		if (i3cdev->info.bcr & I3C_BCR_MAX_DATA_SPEED_LIM)
+			sircfg |= SIR_MAP_DEV_SLOW;
+
+		sirmap |= SIR_MAP_DEV_CONF(data->ibi, sircfg);
+		writel(sirmap, master->regs + SIR_MAP_DEV_REG(data->ibi));
+		spin_unlock_irqrestore(&master->ibi.lock, flags);
+	}
+
+	/* Unmask Hot-Join and Mastership request interrupts. */
+	i3c_master_enec_locked(&master->base, I3C_BROADCAST_ADDR,
+			       I3C_CCC_EVENT_HJ | I3C_CCC_EVENT_MR);
+
+	return 0;
+}
+
 static void cdns_i3c_master_free_ibi(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
@@ -1497,6 +1740,52 @@ static void cdns_i3c_master_free_ibi(struct i3c_dev_desc *dev)
 	i3c_generic_ibi_free_pool(data->ibi_pool);
 }
 
+static int
+cdns_i3c_master_disable_mastership_events(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	struct cdns_i3c_i2c_dev_data *data;
+	struct i3c_dev_desc *i3cdev;
+	unsigned long flags;
+	u32 sirmap;
+	int ret;
+
+	ret = i3c_master_disec_locked(m, I3C_BROADCAST_ADDR,
+				      I3C_CCC_EVENT_MR);
+	if (ret)
+		return ret;
+
+	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
+		if (I3C_BCR_DEVICE_ROLE(i3cdev->info.bcr) != I3C_BCR_I3C_MASTER)
+			continue;
+
+		data = i3c_dev_get_master_data(i3cdev);
+
+		ret = cdns_i3c_master_find_ibi_slot(master, i3cdev, &data->ibi);
+		if (ret)
+			continue;
+
+		/*
+		 * Do not modify SIR register and cleanup slots
+		 * if regular IBI is enabled for this device.
+		 */
+		if (master->ibi.slots[data->ibi]->ibi->handler)
+			continue;
+
+		spin_lock_irqsave(&master->ibi.lock, flags);
+		sirmap = readl(master->regs + SIR_MAP_DEV_REG(data->ibi));
+		sirmap &= ~SIR_MAP_DEV_CONF_MASK(data->ibi);
+		sirmap |= SIR_MAP_DEV_CONF(data->ibi,
+					SIR_MAP_DEV_DA(I3C_BROADCAST_ADDR));
+		writel(sirmap, master->regs + SIR_MAP_DEV_REG(data->ibi));
+		spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+		cdns_i3c_master_free_ibi(i3cdev);
+	}
+
+	return ret;
+}
+
 static void cdns_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
 					     struct i3c_ibi_slot *slot)
 {
@@ -1524,6 +1813,9 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
 	.request_ibi = cdns_i3c_master_request_ibi,
 	.free_ibi = cdns_i3c_master_free_ibi,
 	.recycle_ibi_slot = cdns_i3c_master_recycle_ibi_slot,
+	.request_mastership = cdns_i3c_sec_master_request_mastership,
+	.enable_mr_events = cdns_i3c_master_enable_mastership_events,
+	.disable_mr_events = cdns_i3c_master_disable_mastership_events
 };
 
 static void cdns_i3c_master_hj(struct work_struct *work)
@@ -1532,13 +1824,84 @@ static void cdns_i3c_master_hj(struct work_struct *work)
 						      struct cdns_i3c_master,
 						      hj_work);
 
-	i3c_master_do_daa(&master->base);
+	if (!master->base.secondary)
+		i3c_master_do_daa(&master->base);
+}
+
+static int cdns_i3c_sec_master_bus_init(struct cdns_i3c_master *master)
+{
+	u32 val;
+	int ret;
+
+	val = readl(master->regs + SLV_STATUS1);
+
+	if (!(val & SLV_STATUS1_HAS_DA))
+		return -EFAULT;
+
+	i3c_bus_maintenance_lock(&master->base.bus);
+	ret = cdns_i3c_sec_master_request_mastership(&master->base);
+	i3c_bus_maintenance_unlock(&master->base.bus);
+
+	return ret;
+}
+
+static void
+cdns_i3c_master_mastership_request(struct cdns_i3c_master *master)
+{
+	int ret;
+
+	ret = cdns_i3c_sec_master_bus_init(master);
+	if (ret)
+		return;
+
+	ret = i3c_master_register(&master->base, master->parent,
+				  &cdns_i3c_master_ops, true);
+	if (ret)
+		dev_err(&master->base.dev, "Master register failed\n");
+}
+
+static void cdns_i3c_master_mastership_handoff(struct cdns_i3c_master *master)
+{
+	int ret;
+
+	struct i3c_dev_desc *dev;
+	u32 ibir = master->mastership.ibir;
+
+	dev = cdns_i3c_get_ibi_device(master, ibir);
+	if (!dev)
+		return;
+
+	ret = i3c_master_mastership_ack(&master->base, dev->info.dyn_addr);
+	if (ret)
+		dev_err(&master->base.dev, "Mastership handoff failed\n");
+}
+
+static void cdns_i3c_master_mastership(struct work_struct *work)
+{
+	struct cdns_i3c_master *master = container_of(work,
+						      struct cdns_i3c_master,
+						      mastership.work);
+
+	switch (master->mastership.mr_type) {
+	case REQUEST:
+		cdns_i3c_master_mastership_request(master);
+		break;
+	case HANDOFF:
+		cdns_i3c_master_mastership_handoff(master);
+		break;
+	case TAKEOVER:
+		cdns_i3c_master_mastership_takeover(master);
+		break;
+	default:
+		break;
+	}
 }
 
 static int cdns_i3c_master_probe(struct platform_device *pdev)
 {
 	struct cdns_i3c_master *master;
 	struct resource *res;
+	bool secondary = false;
 	int ret, irq;
 	u32 val;
 
@@ -1580,6 +1943,9 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
 	INIT_WORK(&master->hj_work, cdns_i3c_master_hj);
+	INIT_WORK(&master->mastership.work,
+		  cdns_i3c_master_mastership);
+
 	writel(0xffffffff, master->regs + MST_IDR);
 	writel(0xffffffff, master->regs + SLV_IDR);
 	ret = devm_request_irq(&pdev->dev, irq, cdns_i3c_master_interrupt, 0,
@@ -1589,6 +1955,10 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, master);
 
+	val = readl(master->regs + MST_STATUS0);
+	if (!(val & MST_STATUS0_MASTER_MODE))
+		secondary = true;
+
 	val = readl(master->regs + CONF_STATUS0);
 
 	/* Device ID0 is reserved to describe this master. */
@@ -1604,6 +1974,7 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 
 	spin_lock_init(&master->ibi.lock);
 	master->ibi.num_slots = CONF_STATUS1_IBI_HW_RES(val);
+
 	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
 					 sizeof(*master->ibi.slots),
 					 GFP_KERNEL);
@@ -1612,15 +1983,31 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 
 	writel(IBIR_THR(1), master->regs + CMD_IBI_THR_CTRL);
 	writel(MST_INT_IBIR_THR, master->regs + MST_IER);
-	writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
+
+	if (secondary) {
+		ret = cdns_i3c_sec_master_bus_init(master);
+		if (ret)
+			goto err_postpone_init;
+	} else
+		writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
 
 	ret = i3c_master_register(&master->base, &pdev->dev,
-				  &cdns_i3c_master_ops, false);
+				  &cdns_i3c_master_ops, secondary);
 	if (ret)
 		goto err_disable_sysclk;
 
 	return 0;
 
+err_postpone_init:
+	master->wq = alloc_workqueue("%s", 0, 0, pdev->name);
+	if (!master->wq)
+		return -ENOMEM;
+
+	master->parent = &pdev->dev;
+	writel(SLV_INT_EVENT_UP, master->regs + SLV_IER);
+
+	return 0;
+
 err_disable_sysclk:
 	clk_disable_unprepare(master->sysclk);
 
@@ -1635,6 +2022,9 @@ static int cdns_i3c_master_remove(struct platform_device *pdev)
 	struct cdns_i3c_master *master = platform_get_drvdata(pdev);
 	int ret;
 
+	if (master->wq)
+		destroy_workqueue(master->wq);
+
 	ret = i3c_master_unregister(&master->base);
 	if (ret)
 		return ret;
@@ -1661,6 +2051,7 @@ static struct platform_driver cdns_i3c_master = {
 module_platform_driver(cdns_i3c_master);
 
 MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
+MODULE_AUTHOR("Przemyslaw Gaj <pgaj@cadence.com>");
 MODULE_DESCRIPTION("Cadence I3C master driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:cdns-i3c-master");
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
