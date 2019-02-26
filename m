Return-Path: <SRS0=oKuo=RB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422E3C43381
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 14:29:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ABC721841
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 14:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k4zGjvsM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="DwJo/rJf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="oxwNfjPe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ABC721841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zEbrcRD5L6PIMOmx6Rzlb0g1YRNn+Wxx8TAzCsulvek=; b=k4zGjvsMJuOZzQ
	sI4BOE++UPnGkJE72HO1nApgOk3o/BIy1Ttst0jOvaXYTTv90UDzCWdIYS1QnrlNC4SyguI8PotjY
	XUaIkDB0B1qYC0NYjKlBZXitLfxdZW5ZXKdcSHldyxgpZbTW+ZGEyPXUt9oP0bVBLZTySiR5APb9g
	31wzq8H2qYfc8mGMJfALEvhmnjIznm4fRhOOewRu/4SYrHAFRrix4BncPspwSWdaA1OF9MnILKThy
	icYswS2fcDm+rL8itAvnAmRQRUNOFBY0dvPawQ8/pp0rwV9mS8wBKuAVneL0/9iNutYwjAVyhALsV
	JA7I+AGaBm2qdUx3P6Kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gydjG-0004MF-Jv; Tue, 26 Feb 2019 14:29:06 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gydjE-0004Lv-BG
 for linux-i3c@lists.infradead.org; Tue, 26 Feb 2019 14:29:06 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1QESTTg021765; Tue, 26 Feb 2019 06:29:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=VeLg28jjdx8BveM2ikRd5K8daxT70XvgF9zmJ+MFwVI=;
 b=DwJo/rJfTDSL3hF2c235FNmvfbaf/Qb7ud0jFcIaLS4HObzWYjsiobpoHYZ4j/Nk98gs
 0FF8STcLsiuYsH5TLeraLgJx7a0iNxg+MdMbq2Fk63Ww9BQVAfzX4xErqwHzyqCZNg9H
 kPXjK+2U87Iwc00Q0F8ngMd0bD5p7qinPrxA0FYBTla/SCh42uOMfxHEo7T1ABdukh90
 9X92T7/z2GRPF/DlQF9IyAZFTBPDdp3Uv5S4DOU/d+ydpNUlJ5B6zL4K0ZxScfPgaLI3
 UuXJ9WL4QoElNQamBwsN40XiqCYgVjZ361E84KDz0mcFaAS1D8RFTrg8ljwbMMejA8Tq Ww== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-by2-obe.outbound.protection.outlook.com
 (mail-by2nam05lp2054.outbound.protection.outlook.com [104.47.50.54])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2qu3m1d9am-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 26 Feb 2019 06:29:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeLg28jjdx8BveM2ikRd5K8daxT70XvgF9zmJ+MFwVI=;
 b=oxwNfjPe9KoxsSvrdyr0gNcC654AyuXEUpA5nJz93eVXJo8fFKzKsqIkvZT0/RoCDXX6aVtiZd9OSB9+tj3hIUsm3MQcfj8hxd20WIFouRBhaYDiJLlnJGlQK19NJwMYsesOC9ArVyalipaDBs3y01wv1pys9zYSzGbl7cLaXDw=
Received: from DM6PR07CA0069.namprd07.prod.outlook.com (2603:10b6:5:74::46) by
 BL0PR07MB3969.namprd07.prod.outlook.com (2603:10b6:207:4a::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.20; Tue, 26 Feb 2019 14:28:59 +0000
Received: from BY2NAM05FT028.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::205) by DM6PR07CA0069.outlook.office365.com
 (2603:10b6:5:74::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.18 via Frontend
 Transport; Tue, 26 Feb 2019 14:28:58 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BY2NAM05FT028.mail.protection.outlook.com (10.152.100.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1665.5 via Frontend Transport; Tue, 26 Feb 2019 14:28:58 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1QESucp007893
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 26 Feb 2019 06:28:57 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 26 Feb 2019 15:28:55 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 26 Feb 2019 15:28:55 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1QEStnm029180;
 Tue, 26 Feb 2019 14:28:55 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1QESsPQ028986;
 Tue, 26 Feb 2019 14:28:54 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v2 0/3] Drop support for I2C 10 bit devices from I3C subsystem
Date: Tue, 26 Feb 2019 14:28:43 +0000
Message-ID: <20190226142846.28294-1-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(36092001)(199004)(189003)(486006)(316002)(8676002)(8936002)(186003)(106466001)(36756003)(105596002)(2351001)(336012)(2616005)(1076003)(126002)(426003)(476003)(50226002)(4744005)(356004)(6666004)(47776003)(50466002)(4326008)(48376002)(305945005)(51416003)(6916009)(5660300002)(54906003)(87636003)(2906002)(107886003)(16586007)(42186006)(246002)(26826003)(86362001)(478600001)(7636002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR07MB3969; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 016b7e20-5b73-4214-3067-08d69bf6bea9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:BL0PR07MB3969; 
X-MS-TrafficTypeDiagnostic: BL0PR07MB3969:
X-Microsoft-Exchange-Diagnostics: 1; BL0PR07MB3969;
 20:oqpL+VvCrh2eidFDJOtc4SDYoH1SGmq+WlP8CmXz4LyVFS2T3OwysC7osrN9fnKvvFm35ajzTZ/6UmTgQSSZvlcUMfwaGe6XQV7c09VjlTFLF3YxkQ18cEJJeX/CYzZxeAqlRsynhZtvIHHUUU9vR8J9wmnXRDm5vPd3VbH4w/nZeHq32BIg3WsAJpcNnvQFnbOwsfPvIYpiggvBk6xehpUzNhuk2g+/RLwahlMyOyERHzhHxutnRnxZeJXXHvPfrkR39q2cM7ZcAU3Pcs+f+Zjw8tYntE29w8b8v5OhTSnCzd/IFwKHwDacnw4KHJqqFP/p3GVM4L7uuxTTvfVyZbnvIpPtzJowNm51A90wLXCsChANHrBt2DMnENPB4pFqSzxpuMGmGJvsI7kb0zMI+Lud4JovlW7TEc4PNGAVslaD21nObdeDzWHe6Id3gz9cMHXeNc6cJIwD1MiVS+Ly0fOCXiPdIOLx+J6zzOHrjtGRTh8CiAmOrQlcg67SKHIG
X-Microsoft-Antispam-PRVS: <BL0PR07MB39692F5AA772A1B57C2417F9C27B0@BL0PR07MB3969.namprd07.prod.outlook.com>
X-Forefront-PRVS: 096029FF66
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL0PR07MB3969;
 23:UDLZBanvAs8Nrj9OIbbv1AoBOulNMTr2O9JwmH93T?=
 =?us-ascii?Q?xdrlR6G7k+zTowZOZe1T4dBY6HxWsXExuTeUhajPigqtSZLKTb6KzUPf8OtV?=
 =?us-ascii?Q?ksgZMt2trBwhe7wFjnP4FywrVbiB89zLJ7hwd/MN5/7JztsO8OO6GE4W/vsi?=
 =?us-ascii?Q?/KdizqR5NGTs1eaC52LfR1CERdhfY6IiVV/de9rw5AJOscTf5L6yrzcK0x/i?=
 =?us-ascii?Q?oivTgCq3kKU3Zv9+h3XEbjyMMxipU5FrvEpZ3VcVryuQLLh5yJPO/O0Bk31h?=
 =?us-ascii?Q?aPXj1jDfbLjbt6NOUuCdVp9Hs81J14laWZIbVQTLe79wO8UtsvIb8sj/r1B6?=
 =?us-ascii?Q?B3KVmxDWjnI4tCQEDf3UShVlp3R68ngr16givtB8uxhGPqr5jCn+QglXTNlH?=
 =?us-ascii?Q?ioOWE3/i6H6nCPutkBgruC2+pDTpcGtd5vDz7PkSW+uN1nGVjxGOEN8fDk1k?=
 =?us-ascii?Q?Jz0UAfiZ1vbH2W9kt1CFx/s3Iqpv1NxKKHe6LqxdqTnNyZoK0Ibol6wc0lD+?=
 =?us-ascii?Q?IOXVrlCFpM2vs5h7wlpU86qvPp+ECt3md3YBc1jbY94SFDxFT5H/5YGKSqDo?=
 =?us-ascii?Q?r0cAYKKCF2kUCDsp8rTT9BMLlNPbYTsmBvQZhXJy+gF9S3X1EiTMq0k6qhkG?=
 =?us-ascii?Q?4gebNJMGfuOQ7gW9h41mqno63k+FebaI0eqSAvGSE8U5lO6p3785FUpGoDdt?=
 =?us-ascii?Q?FbP+0sEhT+RaMKQfYwGw73GXcSJI3fRNe+WtmchAmrhY1vicqOrsvPqe5g9I?=
 =?us-ascii?Q?uSsZmD/UunUdYXoxdE3p6POJedZL60Fw+5ZypNKFO4oA28+t0Zg5OuJ3iup6?=
 =?us-ascii?Q?4vyt2yYpXRIIEiZn91HS1GgPX9L0FkrP+KTgxE9Ql7pKQuhNCLnYeuJ07FTp?=
 =?us-ascii?Q?5bbgJf2Lc1GtKxzNhWN2/wyuoMxs2RN53FB5Ky/tnRZmDIeHcT7KJlRq6JsQ?=
 =?us-ascii?Q?A7WetpYv/ghJSmwVWOf4z3rIInhqXMffKb9CcgwC92fkEJKmrSlrgiEENaHu?=
 =?us-ascii?Q?J0nc7LHPqA2jLVhe6JWRCYBp21d0vOAJwePsGvORtNKO5xWAGF7dYidtYRGP?=
 =?us-ascii?Q?6x68WanUtTkPotgMp2CTXhoRYmt?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: f/te+n4Ez4hTFkwEDFB4T2G92EVef5GB/GflGGf6qU6GI0zbvOMTe0WLQL3WkMFkKezmWFam5ID5US0G6HCm92qb6RAjpWI0BO2/JSkEF8q9FpGN1EVd/nfCif/8Qf1zPCiuVabN2AtOpC0ZNDT7u91IoPuLEhbnGatqmjJ6ChMHdiIuR+qpLmgkG8QeneiAs4fHBe0FhgUGquVuHvK2iaCmLG3TOt4GQeHt2rOQx76O4Vq1ydWd2OdCEKZp6KCv1d3X6lPQX6s4mN1jsIZM6Rv4i/X/qSRUNyWGcK9Q8TC8P4dZbm+uzrZnsEVg47In1C4QGaQ67jRI2y9bg7IHt4utViMgob1QMbAsYJR9H9fELTM9Fl6pB6iuo+lIoylppy+VjpH/oCIBokpztHJwIl+KdyhZPu96wfskdsoQtmU=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR07MB3969;
 20:Zb3DVl2+1/z3XvXkKj+jBzVmHviJl/lESoG/MuTNyk4SzxfWNeyw+m1zhsVcVQfadGVj7FQa4l2ItEwkL33yBeNr0f70bZvc6xXJ+XudfERhT2qAvqnhExm0v9Uc+FOrr5+/cFSATHJ/EqTCJtCWzf7xMz5J5r22S0ekprrH50MbZQsZKZ8L16hfM9jqIhwPlS0/lVS7W9012OQ04J0bE99VPTOMkxTtr1Ls1DOjSuplBnlu0FH8EMNXS7cv/9fg
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2019 14:28:58.1932 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 016b7e20-5b73-4214-3067-08d69bf6bea9
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB3969
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
 mlxlogscore=877 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902260106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_062904_653562_9C94FA98 
X-CRM114-Status: UNSURE (   7.39  )
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

I3C MIPI spec does not clearly say that I2C 10bit devices are supported. 
Additionally, it isn't possible to pass 10 bit device properly through DEFSLVS
command and reserve address for such device on secondary master side.

Przemyslaw Gaj (3):
  i3c: Drop support for I2C 10 bit addresing
  i3c: master: cdns: Drop support for I2C 10 bit addresing in Cadence
    I3C master
  dt-bindings: i3c: Document dropped support for I2C 10 bit devices

 Documentation/devicetree/bindings/i3c/i3c.txt | 4 +++-
 drivers/i3c/master.c                          | 9 +++++++++
 drivers/i3c/master/i3c-master-cdns.c          | 4 +---
 3 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
