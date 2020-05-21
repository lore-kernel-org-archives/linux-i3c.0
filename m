Return-Path: <SRS0=vMx1=7D=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B05C433DF
	for <linux-i3c@archiver.kernel.org>; Thu, 21 May 2020 09:31:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 663BF2072C
	for <linux-i3c@archiver.kernel.org>; Thu, 21 May 2020 09:31:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rgL7Q3zh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="ZOv3EFPo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="49u+LOZm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 663BF2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SVOpRQXEt1AJ6bUv+9H815iKJ/DoKfYk6uqfaK1iDHE=; b=rgL7Q3zhS8nbgG
	kt618P3DkOyzBXWZUTVA6v6+bw7ZDnxS9OTPbnppC6VX/lPQEr8unnje+f3qt7Fj37X6ysiwqhTCi
	VrT15Vd4Xg2Zx6MacqbfQviYrBmXs2hiNyE2RmqdXSxad3zEWlBbCpgg6gKiNGe58iNHLY8YI99zy
	DHrvKg4Dgomf4mAdNz7y+P37lyXm397Dw/WYqRu4kBCquDsHNYsb1JvHj6wZa4BDc4oht0ah3KHLx
	RqczI9CChImlMzUYfxgv6GyJ5zUkYvP3p4qdB+R+uX28Um0SJ5kmERT1ulbgMr05ADLXR0ZRvzzIE
	yVSmInTZPKXzCErNwjAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbhY3-0007Jw-4b; Thu, 21 May 2020 09:31:31 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbhXw-0007Cg-E7
 for linux-i3c@lists.infradead.org; Thu, 21 May 2020 09:31:29 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04L9Tf13021553; Thu, 21 May 2020 02:31:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=4/0Bpvf/9l8RH5oOJ89DAbj/B0Cz098KoT009UZr0mk=;
 b=ZOv3EFPowL2Jata6tmWhauGhvmbZUPH4TnYY94upoNvZGVcpB56nygTj8BKuS0/mflXd
 ePD1g5v7j0Zj9fn4z0sTME1xd2KLxxZgPiI6XAfeOeL+v7gtFAjhAA5RDAfeRFDHx8iZ
 /zv2U2BKIWUJ1ulRWGW5FpNq+U22DoYzhGn5y/yvt2fIMzJGMzUJ2rmyEI+TkuW+SV31
 ZKp0L1WrBNvnjIgJGV7ufUE0M/UDJ5CnDfSopOPYybswnhKyWM77hsJuo2UWkOUcsaV7
 nmHjxXbrF63bJOncqLl0cFSb5O3XmObnjJltL5E2MTTvg0A+ZvDxxjkcrpYDg+gyi5s/ 0Q== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0b-0014ca01.pphosted.com with ESMTP id 312bs0myge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2020 02:31:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiglQC6j8ZxZ8soRUp6n25UWq5zHmu8sroN8RTQxjKHOxIHlPCWDGy8TFOsp1KDmyVTL3rc0+i1n1XBoBsDFBEr4hUaxHw2u1bZK2jMIbLwmXLz36qOviu5VV9wdxaRVD14o508lZPugpZq/SWy2Z6UMCqZ+ueqoX2bJBmBEfQeu4JMh2yZWnOpbMFHgTtRynXiR/juuVNI5jpJBZDzzmWuj8cx/zZPZPB/NLx0XMUjDk1J29ugEIh/88ena4ccZn9OITAT3j6Tb5X1GY3vmDzGJyegJHyc5uFABs/xzwN6e0ZBJNjiyP5awjnqX+joR+M5pSn56hHGZuMxRYe/x5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/0Bpvf/9l8RH5oOJ89DAbj/B0Cz098KoT009UZr0mk=;
 b=LTx2gxY2Z2iEt3kJYl9XhmHfpDSdexldXzIDPdlp/dGaBB7Zgkm8TAx/q7bJe6rABtDo/9OR7tM/B7zKo10D8jj9GCT53zn6oEMmkzpk2/f+h1YPA1Sizzt6K/Wd3DvICsbawpP0rj/5znA1lIMfoyy5f559he8fdscJZt4nMUrtxhPPSNfDBncjVEq8OQ6RPAEX1gNFmgB62yekttdUHUrn0qqGVZNyACnkwK8KN87fKOjag/cC8OgIJ6BOQEVhXJTo2Lq/xgVoaMMt10PUhWyHEcAC4NCMOtCJDk2Yi9Nb0DxyBLlpqVr+r89LpCD6Ve4s/OpZeVrjVUFAQ0YPPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.148) smtp.rcpttodomain=synopsys.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/0Bpvf/9l8RH5oOJ89DAbj/B0Cz098KoT009UZr0mk=;
 b=49u+LOZmc7hzSM1GlESUOTtq4weOnyQDJsJb/HSGa3w+GmKqNfBE6QSO9ZY2aKiH7ECdRk11S+Fznm0N6nEUcj/cap60PjT8Y5kChXPXOaS5I3UY/kbNomcSMSYwd+ZuKdkGToYiv7cHswCUPk9ZHOCi/Jl27y5O3KVqpaN1yNY=
Received: from CO2PR04CA0078.namprd04.prod.outlook.com (2603:10b6:102:1::46)
 by CY4PR0701MB3795.namprd07.prod.outlook.com (2603:10b6:910:92::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Thu, 21 May
 2020 09:31:16 +0000
Received: from MW2NAM12FT061.eop-nam12.prod.protection.outlook.com
 (2603:10b6:102:1:cafe::1a) by CO2PR04CA0078.outlook.office365.com
 (2603:10b6:102:1::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Thu, 21 May 2020 09:31:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.148)
 smtp.mailfrom=cadence.com; synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.148 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.148; helo=sjmaillnx2.cadence.com;
Received: from sjmaillnx2.cadence.com (158.140.1.148) by
 MW2NAM12FT061.mail.protection.outlook.com (10.13.181.253) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.11 via Frontend Transport; Thu, 21 May 2020 09:31:16 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 04L9VAXK015774
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 21 May 2020 02:31:12 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 21 May 2020 11:31:10 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 21 May 2020 11:31:10 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 04L9VATP032159;
 Thu, 21 May 2020 11:31:10 +0200
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 04L9V85X032139;
 Thu, 21 May 2020 11:31:08 +0200
From: Parshuram Thombare <pthombar@cadence.com>
To: <bbrezillon@kernel.org>, <vitor.soares@synopsys.com>
Subject: [PATCH v2 0/2] I3C SETDASA and DAA process fix
Date: Thu, 21 May 2020 11:31:07 +0200
Message-ID: <1590053467-32079-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.148; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx2.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(36092001)(46966005)(2616005)(7636003)(426003)(107886003)(36756003)(186003)(336012)(47076004)(8936002)(82310400002)(4326008)(356005)(26005)(2906002)(8676002)(86362001)(82740400003)(5660300002)(478600001)(70586007)(42186006)(54906003)(316002)(70206006)(4744005)(110136005)(36906005);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b101abb-6b8e-4a5b-4ba2-08d7fd69b5e6
X-MS-TrafficTypeDiagnostic: CY4PR0701MB3795:
X-Microsoft-Antispam-PRVS: <CY4PR0701MB379574DF696B685DF5803DB6C1B70@CY4PR0701MB3795.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5GkqODUjarxy0WSmvDsvnhiYd4WksUO9wRKdbHGkDJC5wVMYziId6FiFu+rqqYmlh9TshVQ7zhNysFfSjSnmPwN+lMJjejRmXmEl85Xwj7ZxlRSk5lSajp8RVySvgTd1rasT9KUXrknb56hNG9fu5uImROl8COuI3w7bkJJt/dNiBJtRQwr3p6AZ1ZpTtGTgnSP6SYqmwQ15bIsdlEARmDzi1tTna8EriDVuVIGKOQ4kVtX7zDjtaELdOHbIJni7qd4u6xkaRZc2WQm62KQIKMfM47HacF9C9n8VNfI8wiYXd3knyHTkFqHlzhciLAJ986yg5FNf0pDUy9DWxt+9qsLiJKtDVPXoyVh2p4wZ/qt1XVqaFq/q5qXiS41Z+psjBXeUlied6yv2wsNgSsflx8xgMOKrPVCfc59k6Y1c/RxlitJ2rO35UHNhwrz22YDqJ9YYoObJiQ+XLfEn2fbduG9NnMX57g3OdG1nHqpII25oZJQSlEWvdLOqNZZuhLpN8beap6FlPKagQy7AVTWboKCR77iVf3NJQF6Zgtypsc4=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 09:31:16.0707 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b101abb-6b8e-4a5b-4ba2-08d7fd69b5e6
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.148];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0701MB3795
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-21_05:2020-05-20,
 2020-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=833
 cotscore=-2147483648 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005210069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_023125_507228_FB6A1A5D 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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
Cc: mparab@cadence.com, Parshuram Thombare <pthombar@cadence.com>,
 praneeth@ti.com, linux-kernel@vger.kernel.org, pgaj@cadence.com,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Changes between v1 and v2 are:
1. Added boardinfo attach fix.
2. Removed reattach issue related fix.
3. Reserve init_dyn_addr initially, so that it will not
   be used in DAA and  attempt can be made to set those
   firmware requested dynamic address after DAA.

Regards,
Parshuram Thombare

Parshuram Thombare (2):
  i3c: master add i3c_master_attach_boardinfo to preserve boardinfo
  i3c: master: fix for SETDASA and DAA process

 drivers/i3c/master.c | 138 +++++++++++++++++++++++++++----------------
 1 file changed, 88 insertions(+), 50 deletions(-)

-- 
2.17.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
