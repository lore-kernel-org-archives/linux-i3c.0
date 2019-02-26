Return-Path: <SRS0=oKuo=RB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A17BC43381
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 14:29:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 357D020863
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 14:29:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c2yGvnRg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="SKd219CE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="ezuWxLWd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 357D020863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bo/VpbRMTBhjzrucypuuZpzFVIbFGiNwtJ71pjFUUks=; b=c2yGvnRgT+jyu8
	d+subDucQVKS/+RGMzPnzBuXeMJRp4vK8ytH/5APNmSYFwItW4KlMjVMsST7J3MYCXxbPfjy62174
	g03yhCXBrjBnixegXzrNb6lPIGsgGJ/JMw405h44tkllP0keyvGpqZRZhJN5BHyD+djiDKYmcJYFM
	q6AckGdUAiv3g+BMazVB0paTPcxDeQ9BqFc60i0pk0VlrlWCaDno1iImvk/LSIf8ZigSmRxd2lEC+
	rE/XP02UU2GEh4q1/GrpCDGlYLMCPVbV/SxuwVSBB+XwI8uU1mnVg+oo9hHWEDUrkzvI7fB3u5ysq
	6GrwV6ncXcx/7KbEwgVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gydjN-0004Nj-Rc; Tue, 26 Feb 2019 14:29:13 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gydjL-0004NK-R0
 for linux-i3c@lists.infradead.org; Tue, 26 Feb 2019 14:29:13 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1QESbZb001939; Tue, 26 Feb 2019 06:29:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=lDtSc05F+OvzTMHsQm5VHN/8XgVWFZHxOXy2RnxZlgk=;
 b=SKd219CE039WeDeT/iIN71duJpvQkaoFMlCD4frAqtz1KKDOJsSIess2NmSgZN5tep3t
 BJMBsWyjBtIQFUmorodWIaGUvhjWCvEwnIejxDhoFtS5dBR4J7kEmWt4eZt2yT+pbaf6
 SFA3QY6sj9LFnU3YCcKtQM4zBJYf+445WbYyqYefobTGutmHhmSS8eTE7AwvFb607Y0/
 +X+dpQeFy/bo6xWI6eoaGQZu/WTHeWDzDRoqSWlYsrbJEhpoWnJ7akLMnGglFd1LkpMN
 JUXFpSKOdMrLxxNeDb6uIYg6Ddm4YqNF37x3XSThKmg3T77tZgtWC3loy/cIWOL1mqMS DA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2055.outbound.protection.outlook.com [104.47.45.55])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qw2yrh4k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 26 Feb 2019 06:29:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDtSc05F+OvzTMHsQm5VHN/8XgVWFZHxOXy2RnxZlgk=;
 b=ezuWxLWdDjOFtzuPS0PLGuhdX7uka3DpdBnWcHFw5d7FKVqdds6vuMz8v/KHEU6sWnF4qhzcpg94fY4QuGBGcnYOOFEalnDgwX8y2+3ThRv/L2yGrNpqLN1qGouBjieb49vf9iUopfAUjfVQV2J2YsCbV9gu4V432gB3zkWKM70=
Received: from SN4PR0701CA0010.namprd07.prod.outlook.com
 (2603:10b6:803:28::20) by BN6PR07MB3090.namprd07.prod.outlook.com
 (2603:10b6:404:a5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.14; Tue, 26 Feb
 2019 14:29:02 +0000
Received: from DM3NAM05FT032.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::208) by SN4PR0701CA0010.outlook.office365.com
 (2603:10b6:803:28::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.16 via Frontend
 Transport; Tue, 26 Feb 2019 14:28:59 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 DM3NAM05FT032.mail.protection.outlook.com (10.152.98.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1665.5 via Frontend Transport; Tue, 26 Feb 2019 14:28:58 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1QESucq007893
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 26 Feb 2019 06:28:58 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 26 Feb 2019 15:28:57 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 26 Feb 2019 15:28:56 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1QESu6S029222;
 Tue, 26 Feb 2019 14:28:56 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1QESudP029220;
 Tue, 26 Feb 2019 14:28:56 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v2 1/3] i3c: Drop support for I2C 10 bit addresing
Date: Tue, 26 Feb 2019 14:28:44 +0000
Message-ID: <20190226142846.28294-2-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190226142846.28294-1-pgaj@cadence.com>
References: <20190226142846.28294-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(346002)(396003)(136003)(39860400002)(376002)(2980300002)(189003)(199004)(36092001)(316002)(50226002)(1076003)(305945005)(7636002)(42186006)(50466002)(48376002)(16586007)(4326008)(6916009)(47776003)(8676002)(246002)(107886003)(86362001)(8936002)(11346002)(2616005)(446003)(426003)(76176011)(54906003)(476003)(51416003)(126002)(356004)(6666004)(105596002)(2906002)(2351001)(336012)(486006)(478600001)(36756003)(186003)(5660300002)(26826003)(26005)(87636003)(106466001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR07MB3090; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b992999-8412-473e-d014-08d69bf6bf38
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:BN6PR07MB3090; 
X-MS-TrafficTypeDiagnostic: BN6PR07MB3090:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR07MB3090;
 20:hn3tpX+wMlMDENkdVxhF1rKTQlALt2NENIiIKPG4d1S2oZmr4M4ZOshxB8q7G4oagyWgv37EPGe2RIgfoOyx7bxff/hNU8qqwO+CSPFUfWJqP+5YJqaIhYkgkVieT2gSnX3HX5G90+uf/lzbfRi52NiZYG8uvgjzDdCTXHtBFjlLAyI4Hw0I+WYqW5yCVWCvaedWrSXEs3/NdGl17F3oe2Ip1CzRLhLSHTI7o5OnVrgex0Pce40DVY06srNhQ7fD6EMFiEC8nD1+38lFv7geb69azANbVTTtAP01IQuJ3XMGIPiuY+NKaXVaopaNCfdR4s3FoLDwjtnK1gSetoP7LIibyhDdRchnQA2ihUBIqyWvkNFIlmYh/wTFeywJSQVHUrzXjAMXdZYfLAlieRTktjZ+EPIGXTK5FPM64QWrbyAwj9ueOBVE2muLkJPJi4N7Sm/lKNBZNbNctg3X3w72p7lIqt5k56rhtgugaughgF0+NZqzRRohEdZ4l0U6le0x
X-Microsoft-Antispam-PRVS: <BN6PR07MB30902E8374D89EE5FDDA9D31C27B0@BN6PR07MB3090.namprd07.prod.outlook.com>
X-Forefront-PRVS: 096029FF66
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR07MB3090;
 23:2B9XtPAjSVRra3qzx+FpzW0tsOuczi36oVhUAoJyl?=
 =?us-ascii?Q?rVm4V4G7HAHFSJ9JpmMlq52kG6KkhU2m+4CfuKpiZvY3PhcKVgB0Sq5BgqLZ?=
 =?us-ascii?Q?UBtiq2XU5RgcWMkB90hcneKD9qb5jBTeHOVO9nLCHddv9kq0QZ+0GFg9x+Si?=
 =?us-ascii?Q?2o4Wy4mXQ7DA2N+2zU4l0wkwEYhRDnX2V1tgpx+4wLsR7WQKnVgU3lpNDGGj?=
 =?us-ascii?Q?8iUIkWRrRK3CBdIA5PaVkZAKch9+Ocetqd6v7STBPBl6MN2jWquCvGM6r/N8?=
 =?us-ascii?Q?3auXiRCBH93FKTT0DghjqYMmGQJk0fm6JjpRNznFVoqG9BL2UlTmS3vK78Dt?=
 =?us-ascii?Q?+oHXlWgP/RYrYRKtjtBsIHD/9iIacor6s9gPi+LT6R47YF3mQ5wYvAB0e54x?=
 =?us-ascii?Q?r2XNijjhJrMz1u4wM8IY99S1Nw9H4cd2lEYwF8Dh09fBQYseHtFyZGoXveCw?=
 =?us-ascii?Q?k0XXSDSw8PmQyRFwD6REYjZDIi1oWDXLrbbGaG0HeLPEM49OQcWfVt1JZPaA?=
 =?us-ascii?Q?BbUShI+z+lfDF79uITladk5/5oI1A+9Q2cRhw5YkNeguImCi6GfNndF49diw?=
 =?us-ascii?Q?1uu5p7hCSh0wF94+GfCssnjbG6SgYgRMFH82FBFkjZyNGrzCEtHPSn9JBBsT?=
 =?us-ascii?Q?QKe6sro38vnUAwfvXKbt47oLS8eCzgyDqVTY3WW+qckJUPE+Ox7W15cYh4Vp?=
 =?us-ascii?Q?7FRMQdSIMuln1uOwHNQb+IqGbuj0TZIYZW6eSBhWBJWf8r6CXYHeNRvkS6KK?=
 =?us-ascii?Q?utdYIaTyHGre0s6TXouZUnqylp/cSwQWgcxamnSbo5EQ8KkeIR1DX+cepnd+?=
 =?us-ascii?Q?aYdOAIlCX3lUIBAt8iyWRlARtxt6s+nN/L5F/3l49HmSkEZ/8SkaqQu+Fs3S?=
 =?us-ascii?Q?TI8oJTX8Eh+31lLJJIxSlZ8eHynG3AvqSC0o7MI2R959+I6I+Qtw+ExfVKvk?=
 =?us-ascii?Q?y0/JFShiMY+Uci+dXSmUrPaOeqNHp8EYA9+5/JlIH69FuOII+z6isaXGfRSv?=
 =?us-ascii?Q?P20P+0XA4T5blu1n+hJwdD+CLmhGGIyEt2ulhofkR5w27+Lzd/vLiOpybomG?=
 =?us-ascii?Q?Rv96SRemrfCHw/fPVKh/arZ3/5qrSPYAV5BKcncKkpACAAe2LJ6rgJDJ7GuI?=
 =?us-ascii?Q?z5b9WhoISY=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: sPFaTbPNbWKEL4cSmlGLekD3AabF10pRpBA8D3tMugcSXMJL30LtvbxemXGp75r3z1nvjbrHZuMiKKbhBLETBZDOFGrprqqjJsVkNWg+shAFl/hRZwA5h2KwBlpdnMH7DczHxyHU6C0I4e0V5zkdhGMPbYcaAhLr0c7WH+Oo83NgRHdaP1m5a2OBRhXjNruuMH1JvPGIvG5uTGX28vImf/lMptAVxh0fqp/5FpKO4G5TWZBxSxnvaIjgzYfF+fTsdQSY6iKO/E33tdrRRnD8JpbhB0q1ENouJO8gQ2V7ZQzxT2w2/VsEBWNmdqN3yg3W8wPUOVzYz/weN/YrNSVdl6WFUGHhEnJhcxuOXRgCZnsOmG1OR+cBeKZU1OXMcV934iFKqBnVKtqxoZI5FHFM5E60w0sFx1xsxlhgEh8QaQs=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR07MB3090;
 20:z+fJmck5tGGMKTBpmOLgAJWHKSZlaAbMYuxojCzB50NV13IYdjbJqXQEEDC+jRonaoKDmOWl9Pj3rt2nk0s2B9zlWOt3oV0napeztwEROGwPwBuRhyka6zJnD0NSQ9SZc8hojAn+8Ln/BrBtFuC/YbOa1AWnuVF6OGMRFcwuWm3RA5qBTdr2zqszurZcjKZeC6AlpjR2M6Nt9bbnl48SmAaqy1ZaffoRfzEBNoh83FJALZoRLzGgqAvWBaG12tEY
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2019 14:28:58.9213 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b992999-8412-473e-d014-08d69bf6bf38
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR07MB3090
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-26_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=925 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902260106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_062911_989918_2ABF66F3 
X-CRM114-Status: GOOD (  11.70  )
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

This patch dropps support for I2C devices with 10 bit addressing. When I2C
device with 10 bit address is defined in DT, I3C master registration fails.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

---

Main changes between v1 and v2 are:
- Add error message when registering I2C device with 10 bit address.

---
 drivers/i3c/master.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2dc628d..8c1e365 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1962,6 +1962,15 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	if (ret)
 		return ret;
 
+	/* The I3C Specification does not clearly say I2C devices with 10-bit
+	 * address are supported. These devices can't be passed properly through
+	 * DEFSLVS command.
+	 */
+	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
+		dev_err(&master->dev, "I2C device with 10 bit address not supported.");
+		return -ENOTSUPP;
+	}
+
 	/* LVR is encoded in reg[2]. */
 	boardinfo->lvr = reg[2];
 
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
