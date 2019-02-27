Return-Path: <SRS0=zb1T=RC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFC2C4360F
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 18:38:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1D832183F
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 18:38:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IAJoT8EE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="j58nCgEl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="BEfHUSno"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1D832183F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42m3lw9vq0ZHef6I578/cyQBmLgKdYdWYr+m/P2bpV8=; b=IAJoT8EEDrs45L
	lwPkX0dncWVrkDyE2ZPq/4iRh7i6WyRlqBWpqmEW1RbZqsoLgv4qInLfRKXfpNtRoUwG0iatkW8F7
	mqaIDAtl4Q3fpFkn57ys9UI4d4MISWsQ8/rsHqC0Js8DisS1AJA/ilsm4tkTc5nVzuSHbI/CLxX+h
	fLS9z+T9hYxnFc1hQX/8EWEt3SdFvLAC37Lg3myvTRjwQ9NYTQGCv5Ixzdsn1peEuoqY/d1DiOXNF
	10ol83sJmpQi7kfcTjzz9p2jWeuXs94w2vH8ZPYq1hYHkw/eX4VTp3AdfPnwQhy0S0PTqxYnx7m+c
	FxyGZOIMmi0eVXKUYzDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gz460-0006MZ-Fe; Wed, 27 Feb 2019 18:38:20 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gz45x-0006LM-Cr
 for linux-i3c@lists.infradead.org; Wed, 27 Feb 2019 18:38:18 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1RISYM7032296; Wed, 27 Feb 2019 10:38:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=iXcjCIyR+I5SxaSkc0yCUBbklPT8mgOTx8o7/XqEajE=;
 b=j58nCgElYlx9+RVdJ4xqx+8BZsw98gW6VYhCFr8VrnvDGfKSWKvNXNM+CGtxqcGzsPWL
 ZdbIWfmOlhDcCVb0Ng0Km1vpnmqsOUhMuLVWZ3SzBKs0DTas3HTpuT6g6yUgDOCTevHA
 Jm0UeFkaDoDlQBcN4M3Sf4vW3lwc6IoD43rZrpMuvrx2nholGgU4mWA/X+M3E0vY5ZF7
 pStER5rl4pcj8LpxRfvBbScHUxKBa1vQcbsZ6tBNV4XcoBJLIozyUvrTAg+3fRcqwymp
 fGrfEwgudfwnvp4466aYW/9s0Ief66/NTD0jV06XE2wjj0g7LvihMSDGNO/yYlQVYrYe HA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2051.outbound.protection.outlook.com [104.47.49.51])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2qw9jq5tat-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 27 Feb 2019 10:38:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXcjCIyR+I5SxaSkc0yCUBbklPT8mgOTx8o7/XqEajE=;
 b=BEfHUSnokwNQoXRBHcybSJiePIFBSokN8TdI6kTSjQ2N1aaS8ie35F4lwSlJeeBBGICdkKVhj/OMgADLIOg/OeIAPWyNX0/4LoT9xZTojEcJ1YDdcffGdRxy1NKhzLZN5BIm4RU+0S1eXYCEQA/mY75/DenDEHzMWE9/wCkKoDw=
Received: from BYAPR07CA0058.namprd07.prod.outlook.com (2603:10b6:a03:60::35)
 by DM3PR07MB2252.namprd07.prod.outlook.com (2a01:111:e400:c460::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.18; Wed, 27 Feb
 2019 18:38:13 +0000
Received: from DM3NAM05FT055.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::208) by BYAPR07CA0058.outlook.office365.com
 (2603:10b6:a03:60::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.18 via Frontend
 Transport; Wed, 27 Feb 2019 18:38:12 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM3NAM05FT055.mail.protection.outlook.com (10.152.98.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1686.5 via Frontend Transport; Wed, 27 Feb 2019 18:38:12 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1RIc5n7029387
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 27 Feb 2019 13:38:09 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 27 Feb 2019 19:38:05 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 27 Feb 2019 19:38:02 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1RIc1sC016225;
 Wed, 27 Feb 2019 18:38:01 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1RIc1l1016167;
 Wed, 27 Feb 2019 18:38:01 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v3 3/4] i3c: master: dw-i3c-master: Remove i2c_funcs hook
 implementation
Date: Wed, 27 Feb 2019 18:37:49 +0000
Message-ID: <20190227183750.15367-4-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190227183750.15367-1-pgaj@cadence.com>
References: <20190227183750.15367-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(376002)(396003)(346002)(2980300002)(36092001)(189003)(199004)(68736007)(26826003)(50226002)(8936002)(81166006)(81156014)(87636003)(478600001)(6666004)(305945005)(2351001)(106466001)(316002)(1076003)(47776003)(97736004)(356004)(8676002)(16586007)(5660300002)(76176011)(42186006)(54906003)(51416003)(86362001)(446003)(50466002)(11346002)(476003)(2616005)(486006)(186003)(426003)(5024004)(126002)(2906002)(69596002)(48376002)(6916009)(107886003)(105596002)(53936002)(4326008)(26005)(36756003)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM3PR07MB2252; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cba29063-66ec-443c-5b22-08d69ce2ba66
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:DM3PR07MB2252; 
X-MS-TrafficTypeDiagnostic: DM3PR07MB2252:
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2252;
 20:3sO+0PdjZekcmF++FHJnnGj6B/59BPiJW7dVQn3zaXJvTLIpx9XndwF6BrWf7ZObq4pKsLk7MLO0agc2uKdVTMPYrR5L5mkm43hCfefSCWe+qefGL3JznjtuZlRHGN6kqXweIz3upcyEFFAbXC0sYTaMH5N7Z7+OqiF283mYQu89KIwM+oWmYAydiwiGqJSl/YEWxJE/aZHcv4QqIFUS+mPuswbr+ptxn5Bb1FZwr2xhaoReILroKDC4rtx6Eb3ZNba9Rt/L5KT2nPIIX1f+j5Rz1+wcitlmZpDA4Y4xI2qbsqpxQ/AAGPVvpHvb9/0gPBtUZgG0FwYK6j2fokshqTUcISKIWEsM6iYrBrgKP3Z/1ia4YRFIvUvNRutzdiatmhAiVzwEY27ORpUgNgPaT9l/3+Bsj+lPCA6mBJOOYmiB64b7sUZhdYBbdVrdd2kn+YdEHMeXtj/EiJYevKEyriDbSCQpMCpTqsHYDKTylzCurV94ffpnarfz4XxDD798
X-Microsoft-Antispam-PRVS: <DM3PR07MB22521E1772953DEAF125F09CC2740@DM3PR07MB2252.namprd07.prod.outlook.com>
X-Forefront-PRVS: 0961DF5286
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM3PR07MB2252;
 23:ye/Ss3Msz3qCbaRiDs35DvkJyz9lHPhgE/OQ6KyRw?=
 =?us-ascii?Q?Avk8eHv+Mjji7AYAhLkTcACuHzQigLKawnqTH+hjr/cEc2oxgNlzf/9kwR09?=
 =?us-ascii?Q?BWPFxN5HsI+KOP6fSr+HoDVwoavdYz5dq+NMt7fEgczg0kn8kXjOML/ZNBRZ?=
 =?us-ascii?Q?LZznpYMALhFKIwH33QF+RreXwkMXVPCN420LsVaX376MFA+t2VRjeIAeqNW8?=
 =?us-ascii?Q?asM/EGOl6b5dYL/0FcoIyC+Qjpgt0xGeVkBZKI63RXKXMImbNchNOOgMst8u?=
 =?us-ascii?Q?/PAp3xqxsDpeFNJcLmITdNJohaxEdVYSYiPNElJl21vaiBAcuM9Q8+AesmU0?=
 =?us-ascii?Q?m8kQaZkDo3Y1dshjwVhrg7t79Sj7HC6BQbuz6ogfwzNvRUsqdA+RdZRL2m8G?=
 =?us-ascii?Q?Dp1i3FOK9arZWuesHxohVm/8NzaAE3RW+h0P8eLhJvZ8uQ4unOaScWqfXEHO?=
 =?us-ascii?Q?g8i2hCIkxJa8XGXcL3dq3RV7zr0P+5OKZYM20mCmYQKXbw5dTCZZG8mkJhZ4?=
 =?us-ascii?Q?p2Q4086nQ38trsH96sDOES8Xk94fuA5TVdlr7dHBobOu3gcqrdTMsfLYvhI+?=
 =?us-ascii?Q?dzIJt9Qz83HbCbzRMl8VzjLYXdEChJ4apfqj1an4nYPst2t9y6p7vpJWBrFE?=
 =?us-ascii?Q?0w9R7hoPWhaAx4eYR5efr7oeaYdJeFnecUd5hfsiDh7kmNHU7+eyvcXC2BBk?=
 =?us-ascii?Q?2oL0rOWDqtwhGrQejmNhhofqivhOOeTAXWSaUC15hwm+Ewv8aLcROuruYpqE?=
 =?us-ascii?Q?p1595QX1IIJoY7d+29NSKbSd75Fm9YIR3H/k5W4UpC8Lk+zGlwCHPSSQkkmL?=
 =?us-ascii?Q?l82vAbtPo8pCNeNx3PlYOuYjZm3GgFqsWcYuWUVcUAPO9CNKTtG3iC2UX3Ur?=
 =?us-ascii?Q?6VbbL50kWu4FYJdJh9KkqvQDW536iTNVft0UE/By04dY2elV9JI8w4ObVdHO?=
 =?us-ascii?Q?NtmfGECJksh+rc9k6GR+9ym/dhNjvs+lB91N5ZIlmujppIPT90o9+fk36H0Y?=
 =?us-ascii?Q?Wu7+nJATOtI/XMsTYMcxbEavdGj/HmMlEWzCvY340GJMD99FcJKkCdhMMbDr?=
 =?us-ascii?Q?9X7eHmz+Ds/Abd18XruN2ZL0pIJswyjFCgutX1PnhFZoCgW1/SGm4oJwG3Di?=
 =?us-ascii?Q?RRJnQrgmRteRlSWjqC6MBl+uvThm90nJaL1HIH8Nkubd3mfIPl4Mp9SA5aZF?=
 =?us-ascii?Q?XYLPHIPiGTp+Bw0/vYcW9GNiZrluGnh+sB4byDewuwEC46AlMKR/kBhzQ=3D?=
 =?us-ascii?Q?=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: eHqpfUwNanQ6H0BzUCBra19t6bhl8oMnyu44EYSpCjWSo7kzx30Fl8tuAXXyAPkVOcfgTVttsxk5IhHUnDJDBur+fXFKYxBhTSL6q68W65XwIahhBMm4R4RWeKYq/8Sw75P0NgfuqhOdqBNKqAqeLyghLSnc9HFqauVxWsNUQnIQLoP7rFdkMHaCNv1RzqSuEL5DZRwJl6tUAbmOrK5sju/3AZy+7ZDwW/M+szy4x6h1uVRwXLRko5U3kAzn4mK4hst/I5VcqGW7TCXAp51KcsHw27GAQDIHdykjrlN1zuWxkqrlmQEw1jytFa4hQdqzp0gMMrLkCmnw0AK6k0ck/1KKtsG3C0/DZoKO1y3ivzlfLJMp7sxKcxotO4vx9zD6yiYGQXcZ2TUeIb+/E4+lx66hmz8DYOJ7kok1E1pTG3w=
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2252;
 20:8/kpDiDH6ycWb6WkgLl4qppnXSjfUZd503hyWC6aXueKBBEgnHbQBLIA257Qy23NTP6TB6sLjz7JCHxnYy2icyU3aifIgq6RO9hH4CVQN+I8d56bjZ/4jd2tQNs5C1T3QBbulEnM7GWZU4vNwIYJ8tKkuLsjMTn2A0DpVVqa3Ck8C+iLwIOlz+aeDp/XQnPGG0pKBoYXsIOLCOmJUqbRQebhg+8FXBRZ6N6bGB37fkiU7IgaIwA2GFE0DT0f5ila
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2019 18:38:12.0512 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cba29063-66ec-443c-5b22-08d69ce2ba66
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR07MB2252
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-27_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=991 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902270125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_103817_542121_7E722488 
X-CRM114-Status: GOOD (  10.01  )
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

Because this patch series dropped support for 10 bit I2C devices, i2c_funcs()
hook has been removed. I removed hook implementation from Synopsys DesignWare
I3C master driver.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master/dw-i3c-master.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index bb03079..9934a12 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1069,11 +1069,6 @@ static void dw_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
 	kfree(data);
 }
 
-static u32 dw_i3c_master_i2c_funcs(struct i3c_master_controller *m)
-{
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
-}
-
 static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 {
 	struct dw_i3c_master *master = dev_id;
@@ -1108,7 +1103,6 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.attach_i2c_dev = dw_i3c_master_attach_i2c_dev,
 	.detach_i2c_dev = dw_i3c_master_detach_i2c_dev,
 	.i2c_xfers = dw_i3c_master_i2c_xfers,
-	.i2c_funcs = dw_i3c_master_i2c_funcs,
 };
 
 static int dw_i3c_probe(struct platform_device *pdev)
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
