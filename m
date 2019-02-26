Return-Path: <SRS0=oKuo=RB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45137C43381
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 11:01:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10CA720842
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 11:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="et0OEc4Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="p7/majlD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="Iz3vlibA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10CA720842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9wRQebM53IBW0aha1Wv9O9fUFwfBeqFMovCLvOGaqEo=; b=et0OEc4YpDXglx
	C07S1pyxwOEE9l1XrOEsRH6S67c6Vg647VCEuyHDjcLkkI2uTXHPVaiK4Cv9loZL+IAqP8zri+DfJ
	y7GNcOiudY4FAYbJMeo+hBP3M30anphcq2MlJdjGsichBiWAZfnpswNXkuewJPQbhgC+SHKz7H4xu
	9Q9igkWCLCn9OOTbjAlYXap2aKr+e3OBJCqRTIr7SocUmGcFO6Va39AhUD0J017EJ0guYHEZWt/CK
	OHlaV2krOtPOlAqvPEzYjCwRizwn0fzUJh0je1n0ljhLwgZfCcsjUw2+kwXMPHDwq7gjt81xFu8KU
	6YPnKUPnJ+AbbumR3hmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyaTt-00058x-SC; Tue, 26 Feb 2019 11:01:01 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyaTq-00057k-IK
 for linux-i3c@lists.infradead.org; Tue, 26 Feb 2019 11:01:00 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1QAmo4r025195; Tue, 26 Feb 2019 03:00:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=nYYK7LSkde65NlVKXaSxcKnp5cvWMKrS4qfT/CXpWCA=;
 b=p7/majlD8YRaE0FZXKMVp+I/SjCCrDOgyoJ8lb4xFqafPcJQFiY5NlrEDIPuXEInggwp
 tFHHXPsPCFeT1/DnFbU3jdJUuE32XozRBk9sJpfeCzKuyBcNy3sbOAlY/pM2ku8SU4P0
 3IxQzOdrk9MgXDLBoLU62HgsYUVfVX42yODENSvGYSezi/OBZCnWv/f7uMpDe9NeSlZg
 8+CpVNprAnS85v92ygsuM3JrT2D+c3MhbV6yyryRFowQIvXQDmW/B3KUFte8ivqlJ0E2
 6oL0lUYJ87IL8BcBKQY40TV+9ctR4C0S4bobfNCxnqfgmBxpu4kwlQf8n43EUvjsLCzn MA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2053.outbound.protection.outlook.com [104.47.36.53])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qw2yrgac3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 26 Feb 2019 03:00:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYYK7LSkde65NlVKXaSxcKnp5cvWMKrS4qfT/CXpWCA=;
 b=Iz3vlibA0mH8htYHBgqqde1TXL+ua/QeBALuX2wzIbtP3v1t613iwr/YpLcF//58fSe+jhppuzj8ijlXw60qp9tunk1Uxgq/uRmiDDFWOO1kf+bRViDgZEh4lqS2brmITq+HFS6etPkzSc3uaGeAu7SI1fTVKJU+ZLtEZiicbHI=
Received: from DM6PR07CA0017.namprd07.prod.outlook.com (2603:10b6:5:94::30) by
 DM3PR07MB2249.namprd07.prod.outlook.com (2a01:111:e400:c460::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.18; Tue, 26 Feb
 2019 11:00:52 +0000
Received: from BY2NAM05FT054.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::202) by DM6PR07CA0017.outlook.office365.com
 (2603:10b6:5:94::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.16 via Frontend
 Transport; Tue, 26 Feb 2019 11:00:52 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BY2NAM05FT054.mail.protection.outlook.com (10.152.100.191) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1665.5 via Frontend Transport; Tue, 26 Feb 2019 11:00:51 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1QB0lJ0020681
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 26 Feb 2019 03:00:49 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 26 Feb 2019 12:00:45 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 26 Feb 2019 12:00:45 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1QB0iQR016512;
 Tue, 26 Feb 2019 11:00:44 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1QB0gGv016484;
 Tue, 26 Feb 2019 11:00:42 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 0/3] Drop support for I2C 10 bit devices from I3C subsystem
Date: Tue, 26 Feb 2019 11:00:00 +0000
Message-ID: <20190226110003.5909-1-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(136003)(346002)(376002)(39860400002)(396003)(2980300002)(36092001)(199004)(189003)(47776003)(8936002)(87636003)(50226002)(478600001)(8676002)(54906003)(316002)(107886003)(6916009)(486006)(7636002)(16586007)(305945005)(42186006)(2616005)(186003)(476003)(126002)(26826003)(51416003)(2351001)(246002)(26005)(2906002)(4326008)(4744005)(48376002)(50466002)(105596002)(426003)(1076003)(36756003)(356004)(6666004)(5660300002)(106466001)(336012)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM3PR07MB2249; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 189b320f-2148-4284-223e-08d69bd9ac3a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:DM3PR07MB2249; 
X-MS-TrafficTypeDiagnostic: DM3PR07MB2249:
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2249;
 20:3FS2egUDAKCpH6qpMErMjsXUbIuWAxvOoMfbHNlAJMFQhZ5n+tYo29sl4Sm4pFVgjjnm/TJbZlABi858cgg9q7WNbvuzXEG6CfJgagme2vq/mDQk/18YBX1dUbIEcngnIXlMmmUXftqyKcH65Ag9o5/LMOR35qm+ooGkNAZ2dNCX9F333x+CgljWYbEb0MO1C8/FQpfqrXLc5lLmJeAUW0AQ812ZJPjfmkrx6cr8MwZeDxr4x+7nqVzumpZEPcyNV4df5Q6ZzLcGEWPWD1q8fwpbFv4rtCa85D1ZayiKb062L8fceJlOusZLjS/oVH9VsF9Uo8nccAQ2ez7AfxljlFRky7ntWz/da92JoShevF2hJObGrJBJlID0R3tylFr8YLcLIATO+Xy2SHN0dNBuD/tkZmV81Jhb4VExBE/zyMeS46+9cFF6pG0SPD19U18kohtwQfkp1h++M5H+oylERyMpt58bmViuLE23K/9a4fpVijqDbkBIcdOq66h3fbay
X-Microsoft-Antispam-PRVS: <DM3PR07MB2249065ABA2DEB4BD2BA98D4C27B0@DM3PR07MB2249.namprd07.prod.outlook.com>
X-Forefront-PRVS: 096029FF66
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM3PR07MB2249;
 23:Xo9WA3I7jNtic+PXEmXNGUWlACGgsQkFOnuXuINAP?=
 =?us-ascii?Q?AAYYLQcZk8J1hHekfuFvskEQ/l4w4w+8pMqzvHFnMKzWgAclm35OIDIX/BXD?=
 =?us-ascii?Q?tKW6v7WMVOKblMXDcMhyUSUoEuM3M5OytG/NAvynPOs/mIvQn28IWzWUDwF5?=
 =?us-ascii?Q?32DpeTllU/bRUJddDIRwkDGZ+1CBijeyUEWzZ7zpC52IZwtyduqJF0N4kIwM?=
 =?us-ascii?Q?wIBmaAPole57tFpj5OWcn2nZi9Q8N9VbNZAmSGbQ3m2mdOUKl+SsKw5rZVDu?=
 =?us-ascii?Q?SXI0u7viP6Or4qGxTFvypARvxdahPCZSQvAUK03YcayaEfQosrGOCfOiN90p?=
 =?us-ascii?Q?xnhsGEC8lR9prAnfjBlwG0ms3YPErzCubvKP7TNp6mNVlXH4Stb5slwytXvR?=
 =?us-ascii?Q?zkH5W/dW2bBU2u4eDhh/90u3BX30P1XY9dDfkBqSSdV2pLzjPuCxVSGCyfg3?=
 =?us-ascii?Q?by4b0yWss1jAiVi2N7bEB5netugdLJGdum2xXj5KfF0p3BEdmBYWKCD6dbnl?=
 =?us-ascii?Q?XvrgD9qQn0bMU1/A7EQQmzw3QmdxmuSI+skijmAi7qU6agqJrb5UVcylifkP?=
 =?us-ascii?Q?juViBRgv/nFPuD1+n60lstprVEmsOwxjaQVOh70YEb2b2/ubnYtcraEyNtoR?=
 =?us-ascii?Q?PS1sW9oLhABei6D2WUWKlm+bxS54LX9YfU73OKPriK8pUN8+v6LQrubM3HLA?=
 =?us-ascii?Q?+ni4knamq+cbEzFa5dETD/EVOxFPd+U+03vOHwI2/NhNpdCa2dnloeWq/ImP?=
 =?us-ascii?Q?ocAOPmEa7iYWJqGnJcjzcTjmF8n4oNOCxQjwWirdhqHhNArR9uk8/jd8/vlN?=
 =?us-ascii?Q?ixhS5SPiC8JEB5NK27TR2EUCKQ76lfRYNEAIezEOh9h7StnHRrW75FDmYLK9?=
 =?us-ascii?Q?kZ9MpCEF1MKZ5BBjffT9PUSCFxoBhKc8P8bMumTHP9j5XGLZz/yjLUkhIIfV?=
 =?us-ascii?Q?RqThrpvir0v+OckOmw1xxjLRik6jNYl1Eca0iwN/YRy1f+JEpd2JfFIZP7va?=
 =?us-ascii?Q?uDXZqDcHK7YDChVopreJtegq9TVCsqE2GfYWY4YMcbruzbuCpQ0i7AGXxJGa?=
 =?us-ascii?Q?jrXV16Eal2zB5goNvjLOx9GGMIz?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FI2kuicjp1SoNsSS7VfWdSQQrDjPD206J8oGxIbMuUyzQog2z2adC4WyViAjiBww37DkuSF9yPtZXKDBIwQYFVOEk9MjN6V/pM6z8W+h6mDN8TvopjXlEQpR+E2EI0o3b9mT3JsDHlBv3I4f6URWzh5SA5tE8DUT+2eW/sTBW2o7H+o9MsXeluU87xgDFcqSlsutjF/Fxv7VDVRlxwBCOi427EgyWMIJidNsyTEj38FpMk9jkOxLnPmAz0ZCsLHaflVve4ff+vvMynpxOfyJ62Tu/4YC/I4ptlEkhPIiTsdWbiqOQfmaIK7FJcFkwJAnlPHgdkeUR6mvEqbr6SRIcR1Lmmujjg7RPD4cSUNPLavA6Mo75NE97LhJ1F8lcG91zy0TfD85pxRFEfxK7qu/tLKhtZQcqbYhDFz0UvzuTRc=
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2249;
 20:dBcHqUvlzWS14ew7JRad6nWDRiMPteKERh753rIMFYYA0ZSfY8DkJ4MzUow5FNg3iRQ4yYG/TI37P3zo2p2fGK2XEBdPbhp8iYj2WO6NFX0/APqypIgOlLBumejteRMuclV7AdSeC0jGa31GcRkGNXIyf0wIt5QZPOau7HvCQnsHJ0huhgZq/UaX99on2huXsE7mHNrHxRhg3yJVq+jCZ6/2PEMNaVGJ0IXN8lY9cQzF5IIugjNTCRddWVT7kbyG
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2019 11:00:51.8642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 189b320f-2148-4284-223e-08d69bd9ac3a
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR07MB2249
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-26_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=877 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902260082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_030058_943921_2E67D677 
X-CRM114-Status: UNSURE (   7.03  )
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
 drivers/i3c/master.c                          | 7 +++++++
 drivers/i3c/master/i3c-master-cdns.c          | 4 +---
 3 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
