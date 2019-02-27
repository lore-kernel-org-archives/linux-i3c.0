Return-Path: <SRS0=zb1T=RC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA55C10F01
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 18:38:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E943E2186A
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 18:38:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f1GMQ7Wd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="XRGmn7fV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="cPc1VmCd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E943E2186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EJQ6XNXgK2IiCJa+Dwv8vO+KEoso1/tvcl2LD/6l9E=; b=f1GMQ7Wd+83jpF
	WD0GBN8992biDu6jpVHa5elmmebTiNz+ST6+HX8rew+UHiUxjABirgfWFL0qk+cLD14CJ7/7xo3FG
	Uc/V8f/J/dKzVv6XNULWuBszaO79cusFGZ1eWdZpsWHL8XpJMXvhjKJ6NBwrJko2y4x7Rx9UBCyFR
	JhBTmLQSaR3wo1cCf0DoHW2OiyE6+9PyPIrqSmbFIQMnspYAxCWhqIm0NSJwqrg+gvYqLebzBlDRZ
	JgM0vu4Er/mDoflQhMRkNF4BqHE1NVdX+jifoRbknv5l5lWagJmgzRy/nlgYXG9PuSAR5WeJcSeot
	fjKDNuaLJzvnuhq5W+Xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gz460-0006Md-IA; Wed, 27 Feb 2019 18:38:20 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gz45x-0006LN-Rt
 for linux-i3c@lists.infradead.org; Wed, 27 Feb 2019 18:38:19 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1RITPDZ011993; Wed, 27 Feb 2019 10:38:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=WaHEDkW2GLP/WDIQ14pqnjNBlC9Mpic66zsbSV3XaGM=;
 b=XRGmn7fVdP6sXjQs50/VL9YVhH+ZeCwtSfD43u0k5YO0F9caoTaFhApaL+OpjDFjn251
 aJbXtFfd0UrGU4pXvtc7jOvIFC5zL8cw0jb16Bl4/xSDoUd/UHrSLVIG65kaw1MWjYyt
 856OYwE4j/r+mq1y+uzwTbZzhCu1UJ/tz3QlROAdAOoi/k4jrz/EtNmt0uK+y8mB2Fmr
 /85vuCoPhbOjMqdAqUKOlrqpjF2Js8vb8wX2T0Ha9Y+7KSt5R1h0QfM2fxTA69SS/yxB
 5cQQvhwfF7Q+nkGYIm34/cB8N5K5lIO3Hklu0JlevezDkiByAduSlM2qlU+pCqhsB2x9 nA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2053.outbound.protection.outlook.com [104.47.38.53])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qw2yrqwwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 27 Feb 2019 10:38:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaHEDkW2GLP/WDIQ14pqnjNBlC9Mpic66zsbSV3XaGM=;
 b=cPc1VmCdCoQiF9bSeY53G2wwRy4xktLogg7ROfhgMpXYaSlwjdDEXJFO2yDpd3ExXkcuZiA9BtESmGrUOCxWM1u5vyQb05i7ixCWyflrXynVSuEIrd+p2c1Wsa/qUQ8ZDqbbYyIAfn6VbdYTDQ6qDtPbRN2tXttmMc8h5Qw3XnQ=
Received: from DM6PR07CA0027.namprd07.prod.outlook.com (2603:10b6:5:94::40) by
 CY4PR07MB3095.namprd07.prod.outlook.com (2603:10b6:903:cf::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.18; Wed, 27 Feb 2019 18:38:13 +0000
Received: from DM3NAM05FT043.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::208) by DM6PR07CA0027.outlook.office365.com
 (2603:10b6:5:94::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.20 via Frontend
 Transport; Wed, 27 Feb 2019 18:38:13 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM3NAM05FT043.mail.protection.outlook.com (10.152.98.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1665.5 via Frontend Transport; Wed, 27 Feb 2019 18:38:13 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1RIc5n9029387
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 27 Feb 2019 13:38:11 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 27 Feb 2019 19:38:05 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 27 Feb 2019 19:38:03 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1RIc2jk016279;
 Wed, 27 Feb 2019 18:38:02 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1RIc2ee016278;
 Wed, 27 Feb 2019 18:38:02 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v3 4/4] dt-bindings: i3c: Document dropped support for I2C 10
 bit devices
Date: Wed, 27 Feb 2019 18:37:50 +0000
Message-ID: <20190227183750.15367-5-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190227183750.15367-1-pgaj@cadence.com>
References: <20190227183750.15367-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(376002)(136003)(346002)(2980300002)(36092001)(199004)(189003)(47776003)(6666004)(356004)(97736004)(76176011)(69596002)(2351001)(1076003)(53936002)(81156014)(5660300002)(50466002)(81166006)(8676002)(14444005)(305945005)(6916009)(4744005)(51416003)(48376002)(478600001)(446003)(8936002)(426003)(54906003)(316002)(11346002)(50226002)(68736007)(36756003)(2616005)(126002)(476003)(105596002)(16586007)(336012)(107886003)(486006)(4326008)(42186006)(26826003)(186003)(106466001)(87636003)(86362001)(2906002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR07MB3095; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8942332-b664-4626-0c2b-08d69ce2baf8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:CY4PR07MB3095; 
X-MS-TrafficTypeDiagnostic: CY4PR07MB3095:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR07MB3095;
 20:tyBfZRH7OdiVs2dRSmHf9LObcFV5FrzTCITTuSyfTSxo6LTn0TuCKaOlegd2OBWbPQgSiLMh8I96csg/MIE2nARjuqn0ilUkC8X7quV4V63KX5pmNVn/HGVS3tQvhTNVkY07/JzOmpEN6V2G+aS/1V6JEzMsS6U+rwUhbkuSQ2ND23glXvoDz+Nzuh4dGG6w5F8TGWivqSvdZkVNPcfnuc5QNMc+uMkq45nRlFnvxacxpjVoKO+jKOC+oqAzUy0sIRrXyhho3hAv1OdofGBh+R886ZuXgVr3wE69YQs9jLdkgMtOygnxOSf5gi6mjkgEFtkn/P2zSPc7LziUpIMpOm6EbMwiNYyWiIrCvw0OGsZZ6szcqaxeTOBv0iHEWj1vFQadSyj6o1r22MjkR0UP6Nkp6FNM7u9Qeiyo5NEchrWmYJ5JqEjM40G3SRg/W38J0L7J+0XeY8S76CpZ6mweiesYKXXME6Xl6ELT099y7reMLT4l3hFF6XjUkm6H51Jz
X-Microsoft-Antispam-PRVS: <CY4PR07MB30956B7B143C7CDE818ED069C2740@CY4PR07MB3095.namprd07.prod.outlook.com>
X-Forefront-PRVS: 0961DF5286
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR07MB3095;
 23:DnblPBOIsvxJrghyHW5wViTr5FnBmm7U0zxzH55E7?=
 =?us-ascii?Q?ReiQnPYw25ifJVIJ33AKxCse9wOSRt6OKiTRg5h0i6bqnDqPaYC6utultt+j?=
 =?us-ascii?Q?6R8c9GjcSyPMJjG+YmZSxzQz3IFZ9mqiObErY8JeD+uawrc58nobjwiCeCuc?=
 =?us-ascii?Q?GzL7srzbLIK6h/PFD5Fp90/vALE0JZzLNL93crkNnS4GkYA0qjBuZ+jMESAZ?=
 =?us-ascii?Q?OITo/fzwZEmy8/budFqzeI1MN3K0Wu5aUDhxRGXkrPZMaH36hMXo3484fr6R?=
 =?us-ascii?Q?GJRbNnrkd0GVQ9Pd/YFkBTmemjfe0oJlKYBwTXS8H5wNjHzInchDDP89PZ5g?=
 =?us-ascii?Q?mF1QWEbQStbrbXQNbrgoiVjUHV54TEeMuFZ/IrbJEaW00lXNlrPfAHirgy61?=
 =?us-ascii?Q?SqbETYsQ6GSPEGYlmpyHkqYDHJN0MyxnRDxcNaRAaOx23xHZui8+JYsi4eQr?=
 =?us-ascii?Q?dc1btnMtM4eiB/Z5Uk3qKZecYr/yyLSTg15IQAqB1zDURT0X5lBYdQitGoy3?=
 =?us-ascii?Q?h4PeBl4yIVGCBe39g11hApmTKMnGnVrjeZHeF47TTDgWgIGSc7gjgv4rzsD4?=
 =?us-ascii?Q?teRzC1Uf8NIkG1A0UOOorAPnWjJUxeTheVpT02zTylutYwvlLKy6eQ/yBhtI?=
 =?us-ascii?Q?VNm8HXnAOv8paTxuaDnNHjM12U/xkE9NH+dzzKlp2FJGFvPSyCOXGx/VmibR?=
 =?us-ascii?Q?zOyCzo55Sham+BjvxrGoF3cTQR2hx2e6S+mpubtYOvlHCOAobPqYfaKeZhq3?=
 =?us-ascii?Q?838BzFtOQX3xjRD2V6IZsLxd2wHVLdlJ1iUOw2xWjqMB6OJs6CGZXXbTpcNl?=
 =?us-ascii?Q?gQW99o0dPIMppG8wXbW+G6vXSbnNNiLQBvnt8lefA3mhSQy75xvIqYf54WVb?=
 =?us-ascii?Q?+yCkFtk/zjKGVeXezlgN/42D4VZXC1N6Hm1Uthy+p6CEyC0GC2qFfFETIutX?=
 =?us-ascii?Q?0WSqTZwPfo952gu5gK8TLav9g5abVY6EIinxbwO1xyhZkRdZHG27FWPgt1Z0?=
 =?us-ascii?Q?C55A13G2mkC/zyxOhluZqU4e8BImyBbAW7bYmeNkRo67qGDVsqbqgWIcts10?=
 =?us-ascii?Q?9oZtfENk1o5AQ3wcGtsR8rga6ED+pfWgVQhSQMGxaPVaSSsivD8XrhSypH7O?=
 =?us-ascii?Q?pLKSTHhJzdlP5/Ugz/cMXaSVBNPuIW8TxdVwLbSkXYENp5ncy0AQYOTqtiWJ?=
 =?us-ascii?Q?Izm0qt08OfZsYw6bzRNjc+rH2DrWoKCE51kTukaATIcZYROfiwBagItWDphs?=
 =?us-ascii?Q?Q/uyz9Qjt3wOCJi5rk=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 91gzIdVMcEHWb3A0PVUoN1+QZI6hjG4gUJaQrcmkNpkd0d5G02/heWssVqo+1QJ3/tx7vJRUQnIXEWDaJ4Y3OyH1lOWOMzmDG1Pl9i7NzMNEY1cx0DKwpf5Dy+gtHQX+WxltRTkPpaqrX+PegkwToB3LZasJiHzdMLuG1PiS7k0jWkL7NYI1557E1DEjHpmKNe+tJMoeLLZQLiMr/+eEnycGxdS2ezQqSFtrAcIrMmru3Xzigjleq0wy2isC5EXC9DI6I9e+q/+htkynZy8Qjx3BtIosJ6aTocNZ5pDx53sKxsFnFzv1r4ME2HkoCGervD1rnqqht8KEijiCPZE00tRojm/Aa/qzw9Tp/lb5rRtoKJ+nGE0yXPyxB2bfMDha3vBwVpLm37dDGDnbz1InARQccnclXA1oDpgJpq0J31g=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR07MB3095;
 20:fp4xflR9ka6ofZt2KfJEX8/ZybxabxDr0baMkLI1f7H+sDDXNkFNvDBfdOPcWNkv8U7Ilq0GHHttuIeJjgeJSccWPVG8XRzv9i1pRE0MLvE3JipfgehHst6ZeIhu357PQ8b00uGpDJtXerrVHCZJZq8mgZyP+XX5Q6C5hzUE6hB17buY9f4FQtLoiU1wrapbdG7ES4P+dnpUTxaQ6VnpyjCrpLl6EHjXpXim8hFRHUdTNsRKe4qtcWl9Os4gcFMK
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2019 18:38:13.0061 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8942332-b664-4626-0c2b-08d69ce2baf8
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR07MB3095
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
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902270125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_103818_034308_DC025324 
X-CRM114-Status: GOOD (  10.36  )
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

Because this patch series dropped support for 10 bit I2C devices, I'm
documenting this.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 Documentation/devicetree/bindings/i3c/i3c.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
index ab729a0..4ffe059 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.txt
+++ b/Documentation/devicetree/bindings/i3c/i3c.txt
@@ -39,7 +39,9 @@ valid here, but several new properties have been added.
 New constraint on existing properties:
 --------------------------------------
 - reg: contains 3 cells
-  + first cell : still encoding the I2C address
+  + first cell : still encoding the I2C address. 10 bit addressing is not
+    supported. Devices with 10 bit address can't be properly passed through
+    DEFSLVS command.
 
   + second cell: shall be 0
 
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
