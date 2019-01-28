Return-Path: <SRS0=cSKn=QE=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3757BC282C8
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Jan 2019 10:37:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBA032171F
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Jan 2019 10:37:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hvsKb72s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="UsEYEK2G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="VtgTSfcO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBA032171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hCWF7OFr7SGmkjdD9HdWhee8NsQGHKSNUtwWd5pmgGg=; b=hvsKb72sCzCPzk
	DVltqKIYdRdhZ9oEsd2oq5TiryQpwkBW6SvGDN0rvjKw1siBAIRt35xJjyfLhayJuNpVau7XXtzpD
	63cE+zJQgZDOP2nAB57gcOw9TI+Ikrdr6e5EiF6TmLp4fjfbWTjPdstqMqrnsDPryAixua91F6aHq
	Fsj91BA+dlV2gXmgov5H67svNeuuyCUAu0qoXnvlqLygE/dCYr3YXEMILFZaW/C1uk0VAkIw25ppm
	JVcXgKee/qMX67aHTEkQqWCXvp5UPAXZIu6xe0Raa5/CMC4rhu6w5UQ6VDvW4YTBzq/WYYl9dJxap
	co36tYfx2fnwX7fX7jHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go4IV-000223-Eg; Mon, 28 Jan 2019 10:37:47 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go4IC-0001nh-PR
 for linux-i3c@lists.infradead.org; Mon, 28 Jan 2019 10:37:34 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0SAXeFm007336; Mon, 28 Jan 2019 02:37:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=keC37jB+3zcp4smklWPmzVaxhAoEAhYZR3He7G1n8zQ=;
 b=UsEYEK2GfX1By7YvUSf4KuZWGNrYBidXqNnBGxCqz/1fUX4l8p8p4Q76rPT2dleXxmv2
 3WOzn4bojEsJNY99j46+d2E6u1KROAFSdyBOn+g/ZlXpp0PCJL1uITA3BBKmsDWLjAQ3
 rPm436yhzV1s9WA3X7F2rSC/R1Eyh9SJuNrW/zs7PhXKxTR6ompbu31kD0db4qqCBTXo
 cMgcmBfdpO5WKulw6hiHEPfy/YCEQOnN0YIp4vjAVW47K5OWl7mbimkGUKkz7yPIaPxk
 xmDqkMT/UliaeWMzEBUWMpir0q2a04cogOsXy+8kd25d0bRffhTXOHUcXCPcx7cdjHZO Xw== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2059.outbound.protection.outlook.com [104.47.49.59])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2q8m106wqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 28 Jan 2019 02:37:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keC37jB+3zcp4smklWPmzVaxhAoEAhYZR3He7G1n8zQ=;
 b=VtgTSfcOFqbxTaDYysTmpuB61AdmdG0oDlnJ/ujc/eFnpL5H+OwrR6MSJNfIRQep3UKhnbDgdjKXTB63W5TP3h4MuXxzTD4ILyBxurFRiySmD5DCY0HpxIhrlDdmni80vS58gj3LTDSzoZVX0Uu38Nz7FS5VUU0t7bjxNo0X0h8=
Received: from DM5PR07CA0104.namprd07.prod.outlook.com (2603:10b6:4:ae::33) by
 BL0PR07MB3969.namprd07.prod.outlook.com (2603:10b6:207:4a::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.21; Mon, 28 Jan 2019 10:37:22 +0000
Received: from DM3NAM05FT030.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::203) by DM5PR07CA0104.outlook.office365.com
 (2603:10b6:4:ae::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1558.18 via Frontend
 Transport; Mon, 28 Jan 2019 10:37:22 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 DM3NAM05FT030.mail.protection.outlook.com (10.152.98.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1580.2 via Frontend Transport; Mon, 28 Jan 2019 10:37:21 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x0SAbKMv022438
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 28 Jan 2019 02:37:20 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 28 Jan 2019 02:37:18 -0800
Date: Mon, 28 Jan 2019 10:37:15 +0000
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v2 1/3] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190128103714.GA619@global.cadence.com>
References: <cover.1547227861.git.pgaj@cadence.com>
 <1eca82e2d7bbff19597b78a3ce1ad62273015529.1547227861.git.pgaj@cadence.com>
 <20190115220953.400d06e7@bbrezillon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190115220953.400d06e7@bbrezillon>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(36092001)(189003)(199004)(16526019)(26826003)(86362001)(105596002)(6916009)(478600001)(23676004)(8936002)(2486003)(53416004)(7696005)(16586007)(106466001)(26005)(186003)(2906002)(76176011)(6116002)(33656002)(3846002)(316002)(386003)(336012)(426003)(6666004)(47776003)(6286002)(229853002)(305945005)(1076003)(476003)(4326008)(54906003)(446003)(14444005)(126002)(58126008)(7636002)(55016002)(6246003)(956004)(486006)(356004)(11346002)(66066001)(7736002)(8676002)(246002)(50466002)(18370500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR07MB3969; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; DM3NAM05FT030;
 1:iKBm315PlgzA3RYhxKOL3rQX2C2t0NophgDnHAWmlgw6x7v/Dga6pWfXip6pxFm8yqCs1FiFixNQzKkGQt5KaMwschYTWHkeF7uc+UVTfN5BZRCrkga/D68wj5lfNGvwTm4wYepwglYCR6b4VC4CKA==
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44c57490-ed26-442d-79f7-08d6850c95da
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BL0PR07MB3969; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR07MB3969;
 3:n8UJsX181Vvtt5KUxx9sZDDodXX5omoUr3rI87s/AVZZm8WiT60n9nMaiKvmkBCcMmLWeo1ZkTl2X8r1G8rUG1+2lZIyfRRmFG2vD6aT7l+zZTSbT98itZMIm0SVIuX79VaJg1aw9vjZEWF+s7NEAublz/PyUoo7IVNuNwVDIlAE+ecFl79ioWyBtKiNpy8Dd+T2Pc3OQinAnQiiyPrBYcjf+SxufStDL219bloY9wgQPqmkstr9Us5C9I2f64j4mvePsP2fi+rSgLFYcjKhCjT9nXKdcsRwr6HVRSe4lKWWS9MPQ9fRIRzJ1xCnx8Cn/Bl+sPrvkpfW2IUA5nm4EHSr2/+mfrV6LMkw7aDrANKmjbh8KSJlM3oa+OSJvVSO;
 25:rShIX1c0HQnFgowdNdjFXIudKR22a1CBHwug2dBVm1Di96RyruKlHRVplmGq00makA67P5EGjIb2NBkZ3oq2WQ9UxJHGXNNoSJER2FdJG8knERzK1PU0i/CJbf+qnWzXutu2ZwPcSk6LqWJNa/j6UB0kQWjJ7ym+RP4tw+oEj+RCSTG12lS2Bse5RBy0OJPl/VWOcEbIElSWY2skiMZHd3dwVvjc8zNOfiehxgFdBs/taPE7YnKYwD9d8Aq7qnPhk1JwIS+9YKfoirNxahXsx36Km9Wu+4TTtPQ/PAuxxa2d3PIDwN14wa4KpGtTOpnbp99vVSOvADHE0JTsi7uCGg==
X-MS-TrafficTypeDiagnostic: BL0PR07MB3969:
X-Microsoft-Exchange-Diagnostics: 1; BL0PR07MB3969;
 31:cR50lSPWglYs86t78pq7h9OARzSL64cX5qoqqx3KNgcU3BhKDmb3g1E6E/+56o2oW/F1NB+fu8piGoYPowWNtIhmb7Qv/0imBvQ5QVk9ej0ewqjPznbE0vdEtT39MmeiMpn+BdJbZgZZfoD3ONal73SL5WirteyW+/aBw5OT7gj7RDBV/ko4MLmtH+x5lmgyvCg02hergX7t1wR0vNN5iZUMuJRLjQaFlKhZifPDG5U=;
 20:gTj5dfdR5v5Sso/q5Xs78W1I2gJhrD1ZFhwwxEZqndoXjXcrKyU0UyRu6cQQS1Huk0VdoLW8ASaPiLQDxnz++Ntbj6hUdNxdOGZ9ELcZkQ9KnQqjqOtF7mHjHgZpo3JKaW+Xdpa6Ik+UaEVNvmtHkWPIx9ZjvtO4/6Q313ssA4dqixEaikX7VtpttfMisPfX5aRlOw0zMao80cxUAXpBOXwawY+C6Z7mwy1U2Gecvu/agIVwfV1SkYjo4fE8FlD6NNA1oMOUiapLwq9NiycmsJ9NAXA1utf5oiSBftmumccFirSF/8+1o4y2VLM8ui6KoLC3dpESYJfPzyYTdXg9Itvk2bDVRVHJ62g0gtXwdyCT4ddaCf7jf1Pt6lgmf9y2NYxYcIARfb72L1TheuokzKS+le6y+zKP9YdED29o5KCdXhKTAPdbOqWHiCQim4MfMhHQOY39FAmXu65UNm5NtIuL2VxqcfFSgBNMdu4OOjGdov3ROKgaeOhCX4Tq9BG5
X-Microsoft-Antispam-PRVS: <BL0PR07MB39691793CFF75FA942E49BF7C2960@BL0PR07MB3969.namprd07.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; BL0PR07MB3969;
 4:b4keSXLyKjBIxpz6OLdH5IWqxBjd6h5pFHk2c9oU8dZzJHdB4vzrhCN+05NfFG13Mr2zuuLxr+vgEdrPsaqJiDoA+hkFNpQEyPgjpqkgtZ0eQkUll7mPTXmZ/mMHo0SGRrsTb6EdTTbJYdT6iekvTM70fFqOewtT9C0Q1aIbYKBdLam7H/OIPfmpbtSVyQs6sPQiipS7t8n6pgqjSEkF8tx55tUarmzgeLluJXWWiFIF96RWZcwSbuTQ/diiZlbjdXTpH77TjqhBhOk/bqMoQ4i6Zi6wv5aHFVnFynTpaJg=
X-Forefront-PRVS: 0931CB1479
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDBQUjA3TUIzOTY5OzIzOmIvZzI4ZHIwWUpmdTMranU4OThvcE1lV3Jk?=
 =?utf-8?B?WnFaVGZnTVhkaE5lZWMvejVha0tralZpT1EvSjZRL3pFYWJ4L2hVM1VBZ1d5?=
 =?utf-8?B?bTVhWGd0S0k4c2IzcUZjRUh1YVNFZnNIT3o1djRGSXplRENNS0d4OUF6SS9x?=
 =?utf-8?B?Rit1U0JkQVc5Wm9weU9Jd1V0b3YvR2VpejNWT3V2LzNyazNiY3dCMTMvVUhU?=
 =?utf-8?B?NmpyZnl6QlU5cTVNSE42QUl5WUtGT1I2SHhlZzFEMzNLbTBVTzkzbVhRSmFH?=
 =?utf-8?B?Q2lYbTZPWmpYbnpOS0x1Zlc0ZDZkN0VOQmR4QkF1OWZCS0J4VGNzS3Y1NUM1?=
 =?utf-8?B?YmFCb2Q1V3ROZ1ZQS2hCbXFxUjc2b3lQdHpDdGgyRm1vK0RIZDhsVVh3a0U2?=
 =?utf-8?B?dVZ0SU8xNnk1Nk1BcUtHTVdQbml2RUZkODJhUEZuWFBudFloMmtwTFc0U0dn?=
 =?utf-8?B?c21ZWFhZY25kOFZnOGpTK1QybDVWbm12VFNVZU84bDlRb0FZQ05MYkRlUXlv?=
 =?utf-8?B?TjBNRVYwN3V4YjJlSDU1NXp6ZGNLemFEeGMzYkNVV2MzZXpnSWJXb3JEMVFp?=
 =?utf-8?B?RmdOWWlBNm1YU1FwQjVNM1JQTUNMYllibXh4UFJuQVF1MnhFUmxBU0tRcHZj?=
 =?utf-8?B?N29KZlBEYlV3M2F6MVNJZ2pqbmg5K0QvcWZRd3VQaUFsVS9WbUxEbGxHSDc4?=
 =?utf-8?B?SXBjVE44cEhadjBZR0pFMmNYSjFXMlZ0UWtnVzE4ZVFjVGFRYUYwWnZ2NVdT?=
 =?utf-8?B?Ykt0dG1ZaGFJR3hIamJZWkZYQmNnQ3QrZG90VEFGWGxtdXhCTmlGNCtBRmp5?=
 =?utf-8?B?UDJITVA3QzFUeExSeGc2REIzZTZLN3phWjVJY1lDbmFvSVJEM0NPZHdlcDRI?=
 =?utf-8?B?Q1VIZ0MyeWJjUnd1T0QzTzMrUkJmais2aUlQeFdVUWVLRVlmQzA3c3ZTV0la?=
 =?utf-8?B?TTVwQ3JnQUsrSUNTY2M5N21kSDZGcm9OYmRSdzN3cGo2UDBmVnhmNjFuV2Rh?=
 =?utf-8?B?L2FrQlU4WUFhV2xBb3lmRVVpaHpiTDZNMFNNU2dwWVdBNVAxSlMyL2tjajJ3?=
 =?utf-8?B?WXl6OElWaVhJdVg2UnBnOGFYUXJQMlN1TjJ0c1YrS0ZMc3ZJQzBrUlpKVytW?=
 =?utf-8?B?Y2VyZ2dvQllaUXB3VmxuSUZoeW1ldlNRczhoNGpGS0FqN0JTM1pqdmVFaWdW?=
 =?utf-8?B?UXBiL2k4Vkd6NlVXVjBHVzlxZzVTMGVUc2xOUnFWcUZIOEg0VzdqcXREcFpX?=
 =?utf-8?B?Mzl0WXNCNnBBU3F1aVVnRTRISllVRUI1dGNJTmRqVU44bTYwRWdlQ3ZVQjJp?=
 =?utf-8?B?elByaTVCcWo4RitoL20wVzhab3JUb09hOXNSenhjdXh3bXR6WnRYSzFZWlZ3?=
 =?utf-8?B?bVR3ODM3VDk1d0JwZlRPengrSXpzSGZqalQxcnJXcGFNakxRSGVDc2tUZngz?=
 =?utf-8?B?ZTNFOXZ2RzN1Zmw5Z2k2cnVISXpWajZ3VWNQU2swZHBISGs5eVp6Z3RjL2ZE?=
 =?utf-8?B?MDYvcS83ang5MG93cmY5TEd3ZTRIMDJrSyt5RDFVcmZ0a2lOOGd2bVRQWkQ0?=
 =?utf-8?B?ZzVoR2xjWWtPQkVNYmx1alVrdVdRYURGbDNQTmFhT1ZHMWRFVkhRdjhGWVh1?=
 =?utf-8?B?Q0lPMkdxTVZaUHUwUzViZTZ0a3hWbzhIaVJUakR6ZkVaNC9adzNnTDN1WS96?=
 =?utf-8?Q?86tt+MAyWjX9FdnnWIBdpYv8y1N5ZVPe551cMoI?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: R9cLlwOiKxko1rEmPe/ptnJqfMGMUW65sBdjDX15e1tZvqhh2RY8r3mxjZvijFMhvnxWq14xxlfQAEPZfqfo27zWJ4DUaS4bQsjF4K/5kQUamc7qhMTXiW/eWxwbTpOL+27gq0rpen99yF3zltKZT7b63LlsJ3BvvDK3siA/CJtV4kmYlFKtoqgPA8/ZxRA9DgMMqFLllXDZ0CHvPo8MJalU0qAsW94PKXith2mhZ/FS/Nc4CW7g3Zq2apkhewnUZCo3hA28JlOmx4Fbyw2GIzUqbaQEUwc/YFTPqtjwJJNl49uj5NWqxQ1s1hAXpapnDXyosAZwpPgxErpOZa/yxDfB+qHgvSXbW92s1MUmRN2fjrsRgd3P8Kh82x21hrmUVhAx3OMT+ZCk89RPuKKDYIwZ1SCwHTPZNR5+SYqrSGA=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR07MB3969;
 6:fH824lTjW9b5nLIM4JoN9IF/+XGPJiPbFEIEyhOB3dqmPGUzHxUZqNPeA5gejIzzEK6QSCghxXQ/u5sR+2+cYAnQzyz27TFMuZts6smDBJbJWrkybIckSMzJ+tjRugqHAH8vG+9/CVf0BymtVdXlfqTlLEqGf+fLSrjhc34NQcQCP119DEJlTBjizvqoIOhG7qwFVy3bb6NZan0KiVUp1CGSnLPoihbPSqesgzCDVLIKlhCbMtW9A+eOb3k17qA7r9CG9FYROfNfcekaQCkT5PwvhVv0vNxFrwts6mqTuwqQR4JeFY3dKsJOSB5aIV8zXXWG+wefCcHyTVyBdR5iPSsLP6Sg7rS36ZEn4sWEMzPbx8EuiuB/sDVbrCSRoT9JmeK4ampNh4PqVDGoRwVTFlE/TWLAFPhWgrKkOqq6a/EhEGOjPcNZAvfX1NxDCtJHpAwLmthog5p0cDCAtEDhIA==;
 5:Pi9Or/n3Woq2Z0OjaTh/UMBeuqvp6Ke5w0tk2q8jQoEBBENYzWUloZ0JqfCGGM7Jja1nYHNv9aulFqq9JG2rWEKqPkqjW/cuEd5n5oL3vCfJMyVVlI5JlVS+1u5GVXRNBYIFnNFu2zXi0dbzbNTdVM0e0UNmyoslTrTN/ywmjx6vT9XH8DcwBtH1DG8n7kgYrzFBQ1CseerJnA0FOA1lZQ==;
 7:prov5Pp6brkL1B6bNL+nfiDFbvc+fA5kHTooh8zHtRZUry0I2IyZgLujrBly+avAeFfdr0Kx3tQv3GVDXfrjXIbx0eZUVSfOzhJC0DwXr6upOqjgKyrOVZjHRB/IpnkjV5YhLPd1xK4a5QkQR3gvZw==
X-Microsoft-Exchange-Diagnostics: 1; BL0PR07MB3969;
 20:tGLrpi7pzv1iZTfAq5rFgmQ5J4HCUe/cX2YqZZuKrSOLKkwC2LkaxDsYgCwMIKWjDDvUmqhZQNqwMb4dfEEQefONvPUEfODG5AUqeXIVe+KW1nEtLPVBD/HG/WMntZOzXeJn90CJf0S+E7PXAoTNz4xpEMG0U4OasKZMBCqK3Y/sJzcVP8TVCbCIKPjuGpjm74CmYXReDv+RvOOWBweHcJ2M/YOxhdI7T1JOmslmO9ud5V5vEzQhJXNjeyn7U6Je
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2019 10:37:21.6736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c57490-ed26-442d-79f7-08d6850c95da
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
 definitions=2019-01-28_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=901 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901280087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_023729_478361_57617BB8 
X-CRM114-Status: GOOD (  19.47  )
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
Cc: linux-i3c@lists.infradead.org, psroka@cadence.com, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The 01/15/2019 22:09, Boris Brezillon wrote:
> EXTERNAL MAIL
> 
> 
> > @@ -1727,6 +1836,13 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> >  	}
> >  
> >  	/*
> > +	 * Don't reset addresses if this is secondary master.
> 
> When is the bitmap initialization happening then? I really think

What do you mean bitmap? Are you asking about slot statuses?

> secondary master init should happen early on and be limited to SW-side
> object initialization. We can have a separate function to do that, and
> maybe a separate register function too
> (i3c_{main,secondary}_master_register()).

Ok, I get it. Because of lack of information at secondary master init time, I
decided to register devices with full information. PID is blocking me. I'll try
to separate register routines.

> 
> > +	 * Secondary masters can't do DAA.
> > +	 */
> > +	if (master->secondary)
> > +		return 0;
> > +
> > +	/*
> >  	 * Reset all dynamic address that may have been assigned before
> >  	 * (assigned by the bootloader for example).
> >  	 */
> > index f13fd8b..16e7995 100644
> > --- a/include/linux/i3c/master.h
> > +++ b/include/linux/i3c/master.h
> > @@ -418,6 +418,21 @@ struct i3c_bus {
> >   *		      for a future IBI
> >   *		      This method is mandatory only if ->request_ibi is not
> >   *		      NULL.
> > + * @update_devs: updates device list. Called after bus takeover. Secondary
> > + *               master can't perform DAA procedure. This function allows to
> > + *               update devices received from previous bus owner in DEFSLVS
> > + *               command. Useful also when new device joins the bus controlled
> > + *               by secondary master, main master will be able to add
> > + *               this device after mastership takeover.
> 
> Do we really need this hook? AFAIU, this is only called from the master
> controller's work which is responsible with mastership handover, so
> this can be done entirely from the master driver without requiring help
> from the framework (just need to do it with the maintenance lock held).
> Am I missing something?
>

Actually, I use this hook at secondary master init time (in framework) to
register devices which could be received by DEFSLVS command. I can register
those devices in the driver. Separate secondary_master_register routine should
help in this case.

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
