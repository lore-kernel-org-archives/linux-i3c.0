Return-Path: <SRS0=ixSD=QF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7EEC169C4
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Jan 2019 18:13:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB7920857
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Jan 2019 18:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Alpgbm8d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="Zq4aw1d9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="s91ZkzJb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FB7920857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6jzi0ZkO42oDO9S4qWdxzq9gwm+IyQ+d+3dwfAA42zY=; b=Alpgbm8dOSL1pM
	kmwIIgjbv0Qk/sQ3McRdXrYkbAxeW297XuMbeVn2yxrMWA6osb1Buj7By86hXN8iLrHtDfZdM3WdW
	tZmo6+8IynXydYXm9Tr0pHkW61YFMXF2BnLYop4K0VDQCHyO6YEyvtSg4dkIgTjFpnjJpoEelHQ3y
	uAezHCyPgR5PvGIQTNmDkI/QuohpQRwzyGBxkv4SSujL7nNjf0M8b2jJl6XP6xSS7iMaGCIiltVFu
	xuP5eQVT/zqhlFWPKoXT451syjlYNilDPYOe6QNxDstybktozVXWcFndwYpcMd8ef9jRzt0ZlbGHo
	bYjTEC18GV1wyroCcMzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goXtR-00087V-PE; Tue, 29 Jan 2019 18:13:53 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goXtP-00086W-1b
 for linux-i3c@lists.infradead.org; Tue, 29 Jan 2019 18:13:53 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0TI4l4N024095; Tue, 29 Jan 2019 10:13:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=JBS9btXggZNWC/D0YyuRqgiHdPxKzFe1LlF6nEgu+wA=;
 b=Zq4aw1d9NO+ELqSF9bDEiU2ghPvgcrrDxOYe1zpjC3xW7IxMhH1/5Hlnh2pQ/6Dy6bbE
 FsW3I14HDi6HvaC4o3iVDZbls2ykfnG9EPBLroTnFwqi06f0HbiwnHZ9cUHzrr78gsui
 UhGFReoMg3Lp4XmTbDf46XPQ7V5n/ORnxAIVpa0w2d7IN4ofgVURy9jSMq+hcg+YMrqm
 FxFWTGc+zYSrMtlmmtx5e/xZCJh2ODJpanQJAwEaFw9gqaFrjSkRwDobkWyN5yIzaKOq
 NVX6KF+/pwfmkfxAY0zI1U1W4R1VufefHZP33rrkhcgF9DuOK/vEQcXsThb150RgXOd9 RA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-co1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2052.outbound.protection.outlook.com [104.47.40.52])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qa8174ss9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jan 2019 10:13:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBS9btXggZNWC/D0YyuRqgiHdPxKzFe1LlF6nEgu+wA=;
 b=s91ZkzJbzdohSOYcbYGwRvDBQQzbAPhhrRaoTduQ2rH+4i9VYXutEBvn2vVpYquy2LjjE5l0n5TsFDYJZZEN3s7xq8FQBgLjRs/5llsdSjTRgAID9tXc1keMzoTSd8aPu0eM+ioc+pgBJ1D9SgxvaZVhjo7SnQ3JObFBiuKueP4=
Received: from DM5PR07CA0110.namprd07.prod.outlook.com (2603:10b6:4:ae::39) by
 DM5PR07MB3975.namprd07.prod.outlook.com (2603:10b6:4:b2::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.16; Tue, 29 Jan 2019 18:13:42 +0000
Received: from DM3NAM05FT051.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::208) by DM5PR07CA0110.outlook.office365.com
 (2603:10b6:4:ae::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1558.18 via Frontend
 Transport; Tue, 29 Jan 2019 18:13:42 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM3NAM05FT051.mail.protection.outlook.com (10.152.98.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1580.2 via Frontend Transport; Tue, 29 Jan 2019 18:13:42 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id x0TIDf7S029881
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 29 Jan 2019 10:13:41 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 29 Jan 2019 10:13:39 -0800
Date: Tue, 29 Jan 2019 18:13:37 +0000
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v2 1/3] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190129181335.GA8271@global.cadence.com>
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
 SFS:(10009020)(136003)(396003)(39860400002)(376002)(346002)(2980300002)(189003)(199004)(36092001)(246002)(8676002)(26826003)(2486003)(23676004)(86362001)(478600001)(6246003)(6286002)(58126008)(7696005)(55016002)(316002)(7736002)(54906003)(7636002)(16586007)(76176011)(305945005)(386003)(33656002)(6916009)(66066001)(426003)(126002)(14444005)(476003)(336012)(53416004)(229853002)(8936002)(186003)(26005)(16526019)(4326008)(50466002)(956004)(11346002)(106466001)(105596002)(1076003)(3846002)(6116002)(446003)(356004)(2906002)(47776003)(486006)(18370500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR07MB3975; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; DM3NAM05FT051;
 1:8w13wSStpbuxFfMsDXE8X57kgHdatvLr9VkCkR3otlNlNXOGSGpbrEn4bLSycQPx7ggaWp9RUg0oEBSf0TBz7SMK1g0HIQXtRIHqfd8zKFCSDt5kV5/pxLttstnnHKUOU+Q005FqOt4+NfvQpM8RNg==
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d43afcd-fa65-4d2b-82ae-08d68615806a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:DM5PR07MB3975; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3975;
 3:rzoLXGKyHlK1qmQ5LQUHrrmK3HAzgMMPB2NuerkiqssoVfKPL8zpMQ/O10Sy7f8rXneykwt0v1QXsG5z/QyHQR3bBgODFo7gQE5IFsfP7NtpvusrrNmGg01c+0MEx1CXK/K+pKmgcZN87vxwGekMpTzOXoXUo8+zv3SfnNIK2/gbMlhxM4d1dOgSJRwqrMddHgVkAm6e8cTPqKHwLZEYw/+Ur84FpQ80rJsLWh6pKtG6JFamPpC7j5cXZM2/Eyh60vZ3mQjcABShYjd9v5MdiYkteJxtEbV55JbfWt7qa0E0Mwu1OUmL7OfPIys8lQbemGb83BpqUVdKHreR8oi4IZCAtxU/drwYsPNjoVBsfi00/5DcNItyIwfxuq8rsPXE;
 25:d7JE90BPjAYvDnYpglovnsxVASjGRPZC/EJvsfZTg0afvWN+k54yL+BEEjLcE1cdULb+xutT+B+CXfnLdyF84tOy3VkqaZL5rBHvGMXiaMOoPYqwzULpCDpS0xvArnSK8T67WxYkWkt2GgZtppVz+cIpqWWFck9G0r6eXWwhxWhy6kN8qFHnOWMVdIKAVL2RloXPhzp/huoXRUG2U2gJ/18ltRWkLU1pqtWQCV3845eOpz7do18Pc51kYTtkpITjz5k28BDzRb/sRua8lyXSGMn6ewZCoYzZPYmyQeYCfF85fJXqeL0mkp4fKK99Naiy5UhuRTuOZhhrZ6Iv9X4YPA==
X-MS-TrafficTypeDiagnostic: DM5PR07MB3975:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3975;
 31:28nzzyroE5HLcFt2EP5fflr+uXshjkZEc5KjqghhTYqxT/9xPh0PxTyKLnWytV+FGZvZEWZ+EC0CiRm12jkQIbfeae0dYrCeDXvRVnZE7+6laBqfoT+4PFvRxd48mlSdxzff3aL+UpWqWOSMtqGytUN47ddV4TosqZKBPOL96KEuo9t2AKMjR6/if6bZT3VxEq8GTvqgXKh26XWwAEXiHPvsYnT7zycrEMptWUsAG7A=;
 20:0eQHEh52hbV6iTVu0suAdAZvIc5AyAKNR4XvhaO4icvB+t9lLiMFqD4vHw+t/Wj0fAErXnmZVXq5y0Hygt5sIAV2S/hXFgRaxLrTDlROtKu8B0uyi9KrfV/u7IA323kkuf8uNPCnuFbQamnYEN3cdwkEnZLgv1xTdgDC+Ik9NaU2H1tvSsFsJYf1ZeXcNAqxcozGIjERGrt91Ihb9DAv1tt1AybfL1f4X/gGRfA4gdJWGInh3sVGXRqS1j1HF2bQouPzvms6o2Upjfg7tdvvavbZW/XqDcQjZKrS6ugK+3DWWrMxWehwketIUYioTNU5HoEeTBT9Bx8avc7lbVTdOnvevbaN4KvoB+cK15VJDjBt/6+0GjqRGytj/uBrLjYOQxPCBHent2Zmtv9WaQYg3jSp0UqPSAoEtk1qDCmni6loEBvne3B3mLKa0BDq+lNNeIsOLHuzrvIrAIR//tg4KqSI7rp9A9QQ4211dkOUv81YDucKyJb80M6A/dipEF52
X-Microsoft-Antispam-PRVS: <DM5PR07MB3975752F2793DF110003DCEAC2970@DM5PR07MB3975.namprd07.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3975;
 4:OhHYo5oiqodF0tLq7UyP2A+6da0KXClmKJJveHx5p2FZMo+EJ07bvtf0gA0JdIL0zJ/i3JHvblbEWO0cw8a3E/Z7jeXuA6nNB5kxvQWi/yVdCoDwSrIiqS4KxebNkMjpwgXJmfB3kTbOX8fV35662KWzia0HEO51Knjb9FvBaliKjBme7NmtiIy5qGsiCEzsRpE0A9FyBhNHR4sf5btI+6uR6zWQiEhNJ9tS9GEHa0wfACPTZMTCt432HtQsrXUh5Aj4OcfNZMPZWtzdMIcg+VcffN4fpCLTLQ7qk9SgSl0=
X-Forefront-PRVS: 093290AD39
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjA3TUIzOTc1OzIzOmR3UFdoZ2xqU1Y5c3pQQnlXUnA5VWVvQUtz?=
 =?utf-8?B?UFBKeUFlUXh5UXJCMG9uYlFzQUY5dHFRTWhCOFZaOXc0dXVXMmlYQVgzQ0FE?=
 =?utf-8?B?WjJheG95cHdzcGtlZEs0WENnNWc2VkdOMHpzam4wdm55U2x6a2ExT3F4eE5L?=
 =?utf-8?B?eGhqMDdSeXJrN0FnQTZNaXkzUjU2dHhXa1dLTkN1d0hrQnRBSTREU056VHJL?=
 =?utf-8?B?eGZmaXMxWVdBMWY4RXlNdEhhS0VjSFBPdWJNSXVUazJrNHZ4Qlk3ajJKd2ZC?=
 =?utf-8?B?djhqUGJKK1hTUEFRZ0lwdEFJaUNtNFZKY3d5VkxYSmFXdFoyQXpNbW5KZHJS?=
 =?utf-8?B?cWNBc3dtbmFMV00vdHByeUZyaUdsejQ5YXpKUkl4djJIUGFMa083RVRBSUhN?=
 =?utf-8?B?NDVwN2JNd2ZnZU0vZ1NTRGJMYnBNQ1l6ZWZoL2NUZ2tKZ3lWdWFKV004Z3dX?=
 =?utf-8?B?R2JHZE5Nbzl6YVlqQWJpMjU0SXNOWGtSZ2VuamVoVytNa3hWWjgwZHM4a3RB?=
 =?utf-8?B?Y3pPWmRkeHE3cmxmYTlocGlGOEEwLy9jeVl4MVp6T2crak5QbnRTcXgreEZN?=
 =?utf-8?B?SVBQQlNQbE9VTHk3S1BLNEIzL1dWc1gwNU5sa081Z1F0Ynd2Z0VlaCtPalRh?=
 =?utf-8?B?RlRWbERBNDdRS3JPK284amwwUUxPaEZlSkw3VzhFYVNmQTlENS9CSXAxL3Ri?=
 =?utf-8?B?ZnVkbFNuWWc0TVRFSGwzbWRlV0p2cnhhVURERmlWSTZtY09oWk5hUUs5L2Nn?=
 =?utf-8?B?aWlHWEJjQ045Nk4ya2xaNXlFdWpRT0Y1c0pheWRoT1ZoME96YkZkUXBsZVlF?=
 =?utf-8?B?Vy9FRHFoNWJ5aFU0cStXVzIrQjBobjN3OGJwVEg4SHFPMStab285N0NZQ2M4?=
 =?utf-8?B?MUUwd1ZUcjBOQ1FFdE1HaDh6Wi9zby93WkYrYnlGQXVoY2lvUm9PcWtyMStk?=
 =?utf-8?B?MmEvd3l6bkxKV2pVUlZlZWtkOHN1VDlraU5zRmhsMXNMVWJUZ3lYSE1sdzh1?=
 =?utf-8?B?bXhIUHlOUVhRcWoxNU9ham9zYVZCdkI4cjdlWmxwSk9YL0MzaXUrcUMvYVF5?=
 =?utf-8?B?SnhGRUpneERVNXFzQ2lmY1NWenNiT1FjUUVpTGlJQi96QysrcTFtK20wMmk1?=
 =?utf-8?B?T24rajBNaE80UmJGMzNhZnN6THp5OTV0cklENXNmR2dtaUY3OFd2NVRJbEFG?=
 =?utf-8?B?VnZrRHNvSWtnZnFjZUxQYmxlREo1aG5Kd1FQQ21HTEJ6VnZ3SytUeC9rWDJp?=
 =?utf-8?B?VlFhUWFuQkRPQi9udHVHTXAxR0NLVGhxcUwyYnpscDRNMjRXUWlBb1kyRi9o?=
 =?utf-8?B?Qy9OeHNORU95M01yOVBNb1RHS0l3ZThqRGxQMFQ0WERUbzBMZFp3RTlVbHJs?=
 =?utf-8?B?Zi9pNmcyUSs4ZU02Q3orRVJtWmI5bS9YcDNkZE9kMFNFdGNxN21EZU9yQkZu?=
 =?utf-8?B?VitkMDFmcGluR0VpK0FDZEMxYm9ENnpsMGF3WDFUZDV5bXJxYWYvRnZOKzNY?=
 =?utf-8?B?blJCZTFNNUNtZk9SS2h6N2oxbVZ0UHUrOXVpaGhqd3Izb0Iza09NVUl0RndK?=
 =?utf-8?B?SVZ6Q0grTjE0YjJVY1U0dWFwaDFPb1JHOHUvQjlxR3BLNmNYU1VXSy9IZ0FR?=
 =?utf-8?B?QXpPM2JJbGFOcXVDblJKbWNMNHJPb1lUejZQajY5TXdCdWFkQTVGSmVCTFNE?=
 =?utf-8?Q?iIxvMXtbwc5r5j0vMk=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 1Gt/pQCYu/Klx+Hk8LBekYk/7akPdEuuDTL1b+qjPx4mqsfCkc+XGIqYWin5UpyJp4CT/JCT3LdHabH7lnS4M5u26N3Od4ZTvo8GOeQ0zJMpy0agg/OgO208LIUTfFpWdhufgXinz6h9A7kiZM2uD7puTquQ4d2v9wNHzR/6RHxHesdxGvE+2JWIIxc7tFUEcYzRDMgWQQxbERM19Ourot+ffyorX7HCqMWrvt0puhJ43o6oEEY044KL10mK+j1JsF+6Rkxc7ieI8WNjAsV4e7bq+y6g+yP1MCXZaDn7NJEbEEM41ENCiPJhPqf6PW4py7hBBuNc8BxUOWF9iYVgpYtVKudHb8M09wQ9il3VFxl/SbieD4I+bnS/qc3P/y/Fr9SUplBj2zSHBxjVPF+vC6Gmo8hnue4PDFLqNAON5Qw=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3975;
 6:EatndBjIoLOo9PmQfagYXMR45CnNy6F1LGZPN9574+5rEe9OX9P7Uly5EAcfPvG0+10Z5NzKopKod94RHD85D8S7HczbZK/GAP0sCTEXmEFzb6NdCvcTXJpq8o/vqgxvdfa7Xx0frwqhXfIJ7jMWlaELZG/o/btFPqZQagC7Ii6GD0xhfOTWAdMDn1l7YmZRL4qJmKyWqBYnh48OmOsSvWzRnX2BPypELDZPdEfUEnDmd8qThrlWDLrwmRl5pUTE/J7PUpCUWpfTE4nVhbF1L/YoaPuCjJL1mSBnbFrN+hDMxlqRLxxt+KQYCBUpfTogYYqViYSsxr+dgqKqeaeaXrO5Fa79ZDygUL5SPTg3nQG1+UVyUsec3F20iyBFA7aE5ETqwE2Wu15Ywv6Aond/ovtY+BsjbyBjBdXqYdVy7YBbL3T5YsemQgMIfeBCJV7szzD7JhO/rojuj0sAWjIAbg==;
 5:S5I2UsOfiaTZbRAri0H2brPSIgEMLjw314CCTjyEWJnIJDlncLSdBgsZOREu3MVaUJFyTQVI/EoeUMp52MqURpW/dcDroD8PDPLrjq6hAb5zKyb4us3Z0e0L77nis0fLRHDRg7Nwp++KJI4k7IpwHJ75nAweqF8ZCUKrIebxtfo60RsHyf3c7J/IeC/dcgZjkxYiox15xxomC+XAjjQ+hg==;
 7:PN0EGC6Er1e0hGAeIBru0HfQr6+wtbaQ7qa+/8HcgMVxBGWe+i0YDTB1sCWHurlfCBSwZl1LKOxHu3Fil3gqhmSgC9fiRwxDkR4YRKUz3DkJ+x/D9eB5JYthMgD6zsT69dzl32Ehzx+aLYI2vsbY0A==
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3975;
 20:8F9G2lFB1N1VyDOb0TROf7U6aJDr4sNdlKa3VTU4Uby4Tzc3OvB9bR6+aK+ZVJq6fEuhst/hLrdu15i3JahBBfSFXvhtFbiwRZrGj7yVwA/jl5T3tM/dQTCdysNrzUNZ/nviFtZ18Te7GWtvJFQwFdT16Z/mqKfkI+Jgr8LISc/jsjbcGqhGAadu84utzPXnF7NMrGgIuTuVihAyHvqzMsKK3HsYnlWfIN8v9YO3rNwDLNc+ZkDat3kFKY/nb29+
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2019 18:13:42.3610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d43afcd-fa65-4d2b-82ae-08d68615806a
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB3975
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-29_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901290133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_101351_431529_EAD8195C 
X-CRM114-Status: GOOD (  14.38  )
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
> On Fri, 11 Jan 2019 17:43:35 +0000
> Przemyslaw Gaj <pgaj@cadence.com> wrote:
> 
> > +		i3c_bus_normaluse_unlock(i3cbus);
> > +	}
> > +
> >  	i3c_bus_normaluse_lock(i3cbus);
> >  	ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
> >  		      i3cbus->cur_master->info.pid);
> > @@ -663,6 +728,12 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
> >  		    !rwsem_is_locked(&master->bus.lock)))
> >  		return -EINVAL;
> >  
> > +	if (!i3c_master_owns_bus(master)) {
> > +		ret = i3c_master_request_mastership(master);
> > +		if (ret)
> > +			return ret;
> > +	}
> 
> As I said above, I think bus ownership should be requested in
> maintenance mode, which means it has to be done before entering this
> function. You can probably start acquiring the lock in write (AKA
> maintenance) mode and downgrade it to read (AKA normal) mode before we
> start sending the frame (CCC, SDR, I2C or HDR). 
> 

So, I'll have to call all the _locked functions with maintenance lock.
Inside i3c_master_send_ccc_cmd_locked() I will downgrade the lock to read
(normal use). Isn't it inconsistent that after _locked functions I will
unlock the bus from normal use, even if I locked it for maintenance?

Also, I will have to downgrade the lock in case of failure in all _locked
functions to unlock the bus properly using i3c_bus_normaluse_lock(). DO you
think this looks good?

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
