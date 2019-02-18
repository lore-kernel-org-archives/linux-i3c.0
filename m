Return-Path: <SRS0=nyfO=QZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62071C4360F
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Feb 2019 13:13:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30D04217F9
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Feb 2019 13:13:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DlNjzdXO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="c4tI1Fdz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="IXe+BNiw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30D04217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOsNbr4LCHNZlPmgOd3/8NiN8Grwa4u1FW2l7sNdnpY=; b=DlNjzdXOiQv/ja
	VOHTRUq5MeO707PHkF9eNrST026noi5R7Jvy5lrqsoDAPDYyPxsEGX6/TGjhI3FVvhiU5+IawdSZQ
	5ONutAwckIr0PCC+OUwhdpiESD5D8LWVuK2fw9beseqrayvGQeA2rdureGhHwfmb0isNIaiRVPGg5
	rQ0M7L0LV2+LPic8NVRp039iR93xHFVsbfDyPfZGjfQ27tQFGv3H3ygo/qVVyXGk4kTaTgiUtznec
	qJdeLaUlu1HoUhHWtCO6pBW0D98a5CbwtwgWz9BQDECxiVCsh/ojvXD6Hl729h3Sl0q4+PHXQnP2O
	dcLGhYUDTj/HvNKgJ+cQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvijP-0001ad-QQ; Mon, 18 Feb 2019 13:13:11 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvijL-0001YJ-9d
 for linux-i3c@lists.infradead.org; Mon, 18 Feb 2019 13:13:10 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1ID4TqC008401; Mon, 18 Feb 2019 05:13:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=RL/+uvCer/tAT2++iKZcFH7M5u1Kc6jE32GDXwycRXk=;
 b=c4tI1FdzTbyWCDpjlI4ONXydg89Zar5Gc0SHB6fs3MZn20wtQiY0rdXqvSbw4E/p4DIZ
 UUY6kh7d/7vzk8f5DjxZSw69ujfp+fBrYgiQqzd3HppQ4kljkc1ifbeXXbFs8b/XS6XR
 62YaM0PHgiZpM4nrxGM0zOluPXT4g2Rodw+VZfDv0yVR5QRm5huDm5G1c3tT1030NNWO
 wBjIkz7GEtN64oEVBaD9PBCPGE5r3DUGdfDRhmv/3LlNfECwjauXpYV9P317r2sNy+Sj
 YvpHS8ggINxE+2fww6ABWsl8xO1CDdbMjbZe5fTsayHiRoK7V3U9kvNSWJAjG9J+hC0i 7g== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2053.outbound.protection.outlook.com [104.47.44.53])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qpeyy8ua9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 18 Feb 2019 05:13:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RL/+uvCer/tAT2++iKZcFH7M5u1Kc6jE32GDXwycRXk=;
 b=IXe+BNiwgmuUPz6LwqcU/UCK0A3wqm/Ng9h/Z1b4j9bkrgaTBIw38zkugt5qS2kqH3eA1dkoyMOitOOV3hEcOWWQSd3KkidtPPUpyRWmkRPsUp0GwWxbA2zkXROnUDBAWMFy2FLlYezNlF5aizu7pOHGVye9hii5zBQzF8e+jX4=
Received: from CY1PR07CA0027.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::37) by DM5PR07MB3098.namprd07.prod.outlook.com
 (2603:10b6:3:de::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.19; Mon, 18 Feb
 2019 13:13:01 +0000
Received: from DM3NAM05FT059.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::208) by CY1PR07CA0027.outlook.office365.com
 (2a01:111:e400:c60a::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.16 via Frontend
 Transport; Mon, 18 Feb 2019 13:13:01 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 DM3NAM05FT059.mail.protection.outlook.com (10.152.98.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.11 via Frontend Transport; Mon, 18 Feb 2019 13:13:00 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1IDCuZ8019867
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 18 Feb 2019 05:12:59 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 18 Feb 2019 14:12:55 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 18 Feb 2019 14:12:54 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1IDCs4j001116;
 Mon, 18 Feb 2019 13:12:54 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1IDCsDF001110;
 Mon, 18 Feb 2019 13:12:54 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 3/4] i3c: master: Add module author
Date: Mon, 18 Feb 2019 13:08:45 +0000
Message-ID: <20190218130846.19939-4-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190218130846.19939-1-pgaj@cadence.com>
References: <20190218130846.19939-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(376002)(396003)(136003)(39860400002)(346002)(2980300002)(36092001)(189003)(199004)(246002)(50226002)(8936002)(8676002)(305945005)(7636002)(51416003)(36756003)(76176011)(48376002)(47776003)(50466002)(5660300002)(4744005)(356004)(6666004)(1076003)(105596002)(2351001)(106466001)(87636003)(478600001)(2906002)(26826003)(86362001)(6916009)(107886003)(336012)(486006)(126002)(4326008)(426003)(11346002)(2616005)(476003)(186003)(26005)(42186006)(54906003)(16586007)(316002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR07MB3098; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a848ce5-d5f3-4425-9358-08d695a2cf17
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060);
 SRVR:DM5PR07MB3098; 
X-MS-TrafficTypeDiagnostic: DM5PR07MB3098:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3098;
 20:FaK45SdmwOHik3wfPqNyJlitlfiiOU41UQLrWOzjwcKPOT0KtMyDS1gQMatHVEI5sg4Bb1i4IyAvPuTIZFrfEv1y8BLcm+ii+hecNSH4z9BKiLXobyse/n3tCGcXQDVUyuqwZxTl2bmjyVnY9pYgsDtlEHZFatxu2RVubx6ystT3ZTxzR41l5MF53wUG9TTXlXFnwauaKXO50rj81cMD8VwkZ4ccrkplb4PRxr4ZIABdMJdXEBcE68iJ7gE+PP3dp6yxp3AWtE/lwmg183I9rYHEArMkZI+chFNRXPTiwTnnqax4x+c6MwT1pcCiDlZxpVRZxdBB9Xs8drAVEcup6Ii5EDmbDa6Upj5Ehao2VeviByqwhMd+yuOJGMB6x3E7nqHKeFHdxZVUil77TujzTX5un7jaqNHJTmAUVfticm8VW4gngy0iljJnj2Et2VSsbIp/ISDKNNwJ85lqIZtZl8ErxaL36lX+25NSmqYHLggjgvVgX7Z7HLQRpBz3GEDQ
X-Microsoft-Antispam-PRVS: <DM5PR07MB3098B85E071FF3EBAEFD277BC2630@DM5PR07MB3098.namprd07.prod.outlook.com>
X-Forefront-PRVS: 09525C61DB
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR07MB3098;
 23:+TVWeQJEoE49kLZDPlLuPtGsksssZwHAnndFPS8zx?=
 =?us-ascii?Q?t2L4Fpmm873p7AjVKc5iU0Ji5rJD4iaEIj67qH8I/UcE+ARlkHPQZjTTl6fI?=
 =?us-ascii?Q?R2zwsixucwuxg0pHIzpKIlE8bqhOq1bpVAnnkEAZH1W5pAv0ncmclLI36tpg?=
 =?us-ascii?Q?+hjFvmKxA46Fzj842HjqkAyeBgLdQR+n0Hee/mfwCRiKQRCT42uhMa132wbP?=
 =?us-ascii?Q?mljkAkeqKhkNsqC6PdianVDsFXDhSLqtK5Um0mC3StJotVTxOk57LMxcEg10?=
 =?us-ascii?Q?wlYkVMC1VmCPJ+C+78RWLmu2UVms1v115KqNNchp9dEP+noJgQyGgShIpq2r?=
 =?us-ascii?Q?0HpUJAUnJ/atM2Yu70Un1mvb446HcwkBnWmhkYHDQCUe+MReL0dscJnQOdPh?=
 =?us-ascii?Q?6+ir3QxLezZBSIGplh9Rl+SH93QpKn7sLUYb7J7/K03wIU5GITWqPVbr0XVK?=
 =?us-ascii?Q?u467rBDSDTwJPdP2V02j+wDhY3fgxgb4+fiaz/RV5FNdQMWauGQDKTF257bO?=
 =?us-ascii?Q?VgFOaiq5KaIG8yQ4kTL7nrKCZrGgitrwwrT8CbTkGIZnGz9b1gRzSNHY7aCn?=
 =?us-ascii?Q?AhrZWRydd9vJwZroiYJfm7HixaRWPUXEu0ZaLjnZcfvXAIk7g76+Wf1tF0ZF?=
 =?us-ascii?Q?iQt+tyLMCMkBbmY5PjwZQksZDKEDokPmRVIIhPyGOsNmI3O6GDjlokIsRnfF?=
 =?us-ascii?Q?2n35fXlarrucIUzG/yA9PT8W3A0X4mbC2vZyvGDKzIkp0aYTjRL1sG1Qat8I?=
 =?us-ascii?Q?r9cQjofVNIuKr8cNCAma6M5RR6AXMLpulWmIBA56wKuVb1NHEUVzz23i8lcX?=
 =?us-ascii?Q?kTf/8pF4eNi/PmXcES24EZ+o66vsQUlyh5tlZWjV0GmEAp/p94ocmsn6fwEb?=
 =?us-ascii?Q?n6m1JgUl/f4jzB+7pM1CIyjngJjCou4Zjw1d2BMTf85IdtZI24dxc3fy7Y4S?=
 =?us-ascii?Q?VghEhOWprIRMJ/uWp137Glf1QWoWtuYLY+Pn04m+klNWPb0ixMbq5M53OKlD?=
 =?us-ascii?Q?JUnsYj07wVwIvFUd/TiLuilxr9Yu2KKBwpqv9X+VoRQvnApkp9tCX+EiNesM?=
 =?us-ascii?Q?v9Vng7pJQyN+Ra+W68vVUewlLMWwuitJjlPaqwc+929zqDztSCJfbbPYqU8s?=
 =?us-ascii?Q?FwHljsy39U=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 8MFnRHH+SHue2L1yjg6FlZSYHQuCvoiGK4NQXitzKUWNKlAEXLclsRwa2Al3ZUM1lo58IkWS25E3bPcgLhA7fXoV8eISMnBJUp6wUpBrstDBo1/i9iEJsDg7FXEP+hiJ7h25s5tolBQbuYtW6adM9482HCZ5YOnlNavj2py7Hno+n1Id/s4vVMkmO0NDlp8ZPML4qikRcZD1Iw5nmmnWvbhkZ010WlXcDpnMKqinO56cZv7Ox5gjS9SrzaZ7yaL8mHyd/noi1WUKaUhgVJrzq2FQCITHSJFZxWlqplrDtNXC7p/GHLkqDxeRHKPeIv5gl+HUKXtvZYKd1l8MAmOisR0ToWXoPwL8q3rULrXXSoPhgS4E/UJtYTJU28py0u4XvUIV2YCWc84CxmuPqwNCexTloVSPH7r1Q9+qHcZLIEs=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3098;
 20:sfiFKMKnnFHuK4ExGD3TGZ3VhFW5SB2zQ/fLeJRdpiQ8P5vuOHEoRqUBATIU5j8By2GF0saPi+AUgh/0LNkRcf8yCZ/hiZKHUI75NXyANsufy682N/SDAwQ8/tKT4xQLGi1kpZHBBslUkWfK6jJ1dehe6b4XbTVMySHTJqE1u/AdUkcWlg9IO6BnK1yxF+uu0eXWFqARqteII4e/jwKthEWNALpWtSNazn19LlLjE29tt7KbDGFpacmeuII6xDux
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2019 13:13:00.8421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a848ce5-d5f3-4425-9358-08d695a2cf17
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB3098
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-18_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_051307_719694_53883A80 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

This adds myself as an author of I3C framework.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 14493e5..01c6bf8 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2018 Cadence Design Systems Inc.
  *
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
+ * Author: Przemyslaw Gaj <pgaj@cadence.com>
  */
 
 #include <linux/atomic.h>
@@ -2935,5 +2936,6 @@ static void __exit i3c_exit(void)
 module_exit(i3c_exit);
 
 MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
+MODULE_AUTHOR("Przemyslaw Gaj <pgaj@cadence.com>");
 MODULE_DESCRIPTION("I3C core");
 MODULE_LICENSE("GPL v2");
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
