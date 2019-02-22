Return-Path: <SRS0=3YcD=Q5=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3E6C43381
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Feb 2019 21:09:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56793206BA
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Feb 2019 21:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gFXI5Tgt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="fBeoQDkn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="RDEi1wAA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56793206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUBlY0ahSwsHBxw/z4T5pwNCmYl/gfhyRA/Cl3kRzeU=; b=gFXI5TgtWN0Oa7
	T6aEIrvMGfN+IuYZZMYO5o8mvagOxbRQ0C4ZlpH7ECBFmxC/mOOKMqRqKOtfgddNt/E8VFtQ5n3Qi
	C3jR/97pNiBiaEHzxJfUKk2tIjkr2URcaTv0WqFnClB4jfJRmAtM4WQ3b36c36q17/tSzis669WRg
	HV5+BExukDuLgkLCNqtSF4bfI8yrs0jcF2IDyQRvJL2vaGS1X/cFOOzgyd5muH28BHkvjcpuVp5rS
	p4WJL1yzJtteddY+9jw5whQgN6ptvl8/5jFgZ8DA/md2C9hyAZn8HIhbKSnYI823rf1nQLrOrtBCV
	KOXXMX0SfwAq82b4CrlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxI4U-0005zV-VQ; Fri, 22 Feb 2019 21:09:26 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxI4P-0005yc-Ji
 for linux-i3c@lists.infradead.org; Fri, 22 Feb 2019 21:09:25 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1ML3nmp007793; Fri, 22 Feb 2019 13:09:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=dbhQwbQW8npKmnni9A9YLIGZMgrrKgy/yeb38uJOVZ0=;
 b=fBeoQDknNVQdX9Ds4pODf0NBcedlGEOtZpiKO48KDtlzEF7TfzTieiSbiarwBfGgDpZV
 25YtW7SNUVwoQfwfr+yKfukfcrZQ5zHk4oObuLFco1HptaB7q/abIGKso2UW0X2iWQ2V
 7MOlCWcQxjXnx4MfR7U2jYXUGSs5gGXTb7mDYC42OPSWIdKxgpbNQzHm7GX9xM+oz/Il
 WMhzrSTVYBNU8Z0a1Kp+jVu+wl2H56uxHprhLWRuIxgFU7HI6WmxrYCGqM4gLH7p//np
 veAI+qaT61sE6jJUyMJ2dTK6kOzYD/LeoaMFfyIQp3rOizxNDqj1aV+sLMs2RjwSWscW Gw== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2052.outbound.protection.outlook.com [104.47.44.52])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qspmmrh9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 22 Feb 2019 13:09:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbhQwbQW8npKmnni9A9YLIGZMgrrKgy/yeb38uJOVZ0=;
 b=RDEi1wAAPgHsOf/6v3kUFkkn26YrRKPrcZJcO0gL82ae7bCa99sewVM08L8wAKEkHyNXTSzo/PPvw2lBmiScmHMXRbJhrAvzk3bJR8I40ZcuzgeptLReUFqrfnYjcMcrflJHl3eHXgDKrV0MgK7tl6nowkMx1G6SZpjJ/LhtoQY=
Received: from DM6PR07CA0069.namprd07.prod.outlook.com (2603:10b6:5:74::46) by
 CY1PR07MB2247.namprd07.prod.outlook.com (2a01:111:e400:5a10::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.18; Fri, 22 Feb
 2019 21:09:15 +0000
Received: from BY2NAM05FT045.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::209) by DM6PR07CA0069.outlook.office365.com
 (2603:10b6:5:74::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.18 via Frontend
 Transport; Fri, 22 Feb 2019 21:09:14 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 BY2NAM05FT045.mail.protection.outlook.com (10.152.100.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1665.5 via Frontend Transport; Fri, 22 Feb 2019 21:09:14 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x1ML99cp025536
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 22 Feb 2019 16:09:12 -0500
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 22 Feb 2019 13:09:06 -0800
Date: Fri, 22 Feb 2019 21:09:03 +0000
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 1/4] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190222210901.GA5138@global.cadence.com>
References: <20190218130846.19939-1-pgaj@cadence.com>
 <20190218130846.19939-2-pgaj@cadence.com>
 <20190222163010.44a6b7f2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190222163010.44a6b7f2@kernel.org>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39850400004)(376002)(346002)(2980300002)(189003)(199004)(54534003)(36092001)(81166006)(81156014)(68736007)(8676002)(97736004)(53946003)(30864003)(58126008)(8936002)(5024004)(54906003)(86362001)(316002)(16586007)(14444005)(229853002)(6916009)(7736002)(305945005)(55016002)(1076003)(53416004)(47776003)(6286002)(2486003)(426003)(336012)(4326008)(23676004)(106466001)(33656002)(478600001)(6246003)(7696005)(66066001)(105596002)(5660300002)(26826003)(53936002)(3846002)(6116002)(386003)(26005)(6346003)(446003)(16526019)(476003)(2906002)(186003)(11346002)(50466002)(486006)(126002)(956004)(69596002)(6666004)(76176011)(356004)(18370500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR07MB2247; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92ae04bc-5050-4f2c-1520-08d69909ffca
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:CY1PR07MB2247; 
X-MS-TrafficTypeDiagnostic: CY1PR07MB2247:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR07MB2247;
 20:xqPx6ZHiklDCc0Z/sOGTt+bh6Nji1eFTx1yIFjSdlsOYSIa3UcZfLdXDzBUScxrueQbo9rS7Lth4YZr1lMeP2sJ2Q5PHfYnlAxl20VSKWXxNpbCx9VSU6l9QlKFph1ZFJ8GWMajlhECJziDXKbqfq7FJ53r1S87j6LveECoBsUwabe+DBMHv3xMpPkaGWo4Q3cpb49/GMxws+wuJeSIImGNv0WS5Tg+VLksU4noEQePwrkC+4nHqHQyKbliwnkn9aGzBdp+qx1S14xSbrjWoRB3shhbythI4jHluO9sD4vyQTpFORzKlFbHUlSVlQhzhWst59bsn23Y81tFw5rDRrBp7kc1JTeD2LoDEY+YJdP38HAaQGz9ZS6dH7ztNLEaAA9etRAnp4uE/2cBRTpNW+5sYr5i/gxwM/yVf+W+W/6AJlsCODZAt3Cjm/Gz1dzlkUqF4bCMntGhA/Y0rFmxmtupChkNXmwq9OVujN7Dsyy6tmDYPGRe0bdhuPgrCxLF5
X-Microsoft-Antispam-PRVS: <CY1PR07MB2247DF9CCBDE311E3DF3807CC27F0@CY1PR07MB2247.namprd07.prod.outlook.com>
X-Forefront-PRVS: 09565527D6
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjA3TUIyMjQ3OzIzOkNWOEpxRTFlWnlGZEd0RTRMcEg4ckczbTZi?=
 =?utf-8?B?ek5BYkNYby9Ld1hZQ0dNM0RaWkpNRHRFWGVDbUF0ZnVXMEViZG1WT1Zkb2RI?=
 =?utf-8?B?MmVvQmc2Yk9TSUhXVElHbGh5WGVvVm5mUzYwNlJmRzUwQXVNZFdOdnJCc1Fa?=
 =?utf-8?B?enBCSDlLSWhYSkdjaDdRR0JhajMxNXEreUFaNlV6Vm1JeEdqcWRBOXNnaXhT?=
 =?utf-8?B?dTZVMjRESjFLcDJVZDF0WVFxa3RrVGNuUmJ3OG5YY2hsdmxaeVpIWTF0R2hQ?=
 =?utf-8?B?UERjMVRTa3hNUTJKOVVqTUd5TFJSZER2OTM1ckZ6dHBWUmxoRDlpUzhxTEJQ?=
 =?utf-8?B?ajBqSU5Sckt0dE9YL1BRL3ZSZEFjb3BaT2dWNHFQV1Nob0ZVMVJ3cEo3OTk0?=
 =?utf-8?B?SDhYck5pWkZlbklyVnBoTEJyWk9kR2ZQODk5YTVydUFSWkxERzNjalN5Vi9x?=
 =?utf-8?B?dm1FQmoyNnc2NWV2UzZoQnpaN1QyajZjbEpKN1Q0OUwrRWppTHFiYnVEU0h1?=
 =?utf-8?B?US90OFh6cWo0aHc1aUczRXY2eDYrNTA1cGNsSGJyQ3hYZEdVTWM3Rk5VMzFY?=
 =?utf-8?B?aGIzN3pQdGt1T1hISDFUd2pUVXhySERURis3UVF0eUtZeGU4SnZGR1MwNElQ?=
 =?utf-8?B?VUdzWVhHVUxPbkFkU3drdG9xNnI0UTBlU3hxU1d6VlBzRWUrS2tOTmVJUUhM?=
 =?utf-8?B?RVZVVzAvOGFoWjhUTU1VT0RJVkZVQ01wZjhyblZuWjVMUi9sMWlTVjdMemMz?=
 =?utf-8?B?UGdxU3NYeW5ubmxwQ0dwYW0rUEFualFYWk1EUG9LTXVFRDkydGV5VDBCZmdU?=
 =?utf-8?B?QlJTTjlFazNmd0ZCL3hVNytlMDVUV2ZtV2RxVzJzU2t3YUthMjZSMHV3ZWJQ?=
 =?utf-8?B?Z1RYRUJMYUtKMUhVTG1rcWNtSVl2aTEwdXVvYXdJRkdSOUtqUlJ3aXg5UzRT?=
 =?utf-8?B?SnhLdDFFK0VrVUVOSTNvYmZnVVc3T21oZUx5cys0U2wza0J6N3AwcllHUzd4?=
 =?utf-8?B?U1Z5NlhaaDZvL20zM1VVWFpCWDZGZWxuYmtkZTA3Z0RlYVFmTFcvV0F4YWdW?=
 =?utf-8?B?MGxLcGtGUVQ4S1hMc0pOUHFJb1JHVXljUWIwRExIMVNJRmtoWElvbDZYTkFw?=
 =?utf-8?B?RTRyUmVURi8ycXYyd3g4TExSSVkrOEpUVXphS3pwR3ZrMS9vckpSNHUwNXVz?=
 =?utf-8?B?Zzl3Z1paMHRKaG0yT2MxSU5TVkt5WVdkMFM4eVdjVytoQ0JFS0FQenFtaU80?=
 =?utf-8?B?Tmp5Q2kzaW9YSkZOazRMS1UvZDlWc05EMUhxWXFTL1l1ZW1PRmlJdjJXajRu?=
 =?utf-8?B?TmFnYXhLWG5nSUlQVCtMZUZVbytlZHE5NHRILzlhKzExZFlFUmZQY0w4S0E3?=
 =?utf-8?B?QlBLU2FNdTA2TSt0T2JXems1WTNOamhZc2ZqaWgwTE9CRE9HMHY2WUM1THFy?=
 =?utf-8?B?NkZxOWJSQnNFVk5pV0NkT0R2RDBRbmkxRHV3czhJaTFVQ09tMXJOZEwwMkxQ?=
 =?utf-8?B?TjZJVUxQRWRTVnlXeWQvUnp0SnlOVm9vSEQwT0NMbkxoWit0UkdBMlNiYUI3?=
 =?utf-8?B?Q2p6c2JMSXBtME03TCtVOXNmUkErem43L1BIUlVFNHBaMXlHbHRINm1ucTRt?=
 =?utf-8?B?SGJrMmRCUSswVHFKS0RkMkRJMFJiOTlmNmFyWmcrR3hkSlZGdWd3N1B5TE5Q?=
 =?utf-8?B?MG1DVXlnb1JXa2wwTXJpdHRmRzFpV1V2a2lUcjJ2dE9VTW85RmZqYkF0c3Zj?=
 =?utf-8?B?NGxRNjN3SW1FK2M3QW5UVHo4UHJWN3pGaTFpSk5ia0lvVXdvbWVsY0R0Tk9l?=
 =?utf-8?B?Z3krbXpRYVEwbkhINHFLNDhCZnYzc0xvdDBpMFh2eXZ0NGZEQ3Jlc0JpTkFB?=
 =?utf-8?B?M3pKRGRGanNjd3VUQWdxTzBuVmZ6aThONzFCRlZWaUpwajhwOHJ6NDdFZUs0?=
 =?utf-8?B?ODhzRlJmWWN6QVNPY3N1NWVmTXd2Yy9JQk0xZlJlb3pEdjF0NTgxVzMveUZY?=
 =?utf-8?B?UVFwTVhKZHRYSWVKOFMyU1VPMUM0M0tZakhqUT09?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: kl8yrE8TYIkNiYuSyFpBL4i/o7z+RfnO8QxpJPAbbFRI/6dZqT7aZugm7p3AkRRZtNWHXmeL293+RMkclKB8A6mXbNw8wYE32FjbGebXKxe/mKaAFYXAax2dMiQtjX1N90qrYe0m+Ije6Q/tnZJFXUOHtDgrraMqQpwZi8eASsfpqcmXXCrM8lzVFW387fAPPKxtHflQQ6rv8u5jlyqjARDdtb7b2MaqUupM1fTqIUT0IjS1E88IHpoGXt90EDwxKFTOtl+3pUEI8qoNTmNBYReYGWd0stoJNu7ITHCHNZQg6f0Ec+TFvAn/hDpon1Z4hYKxb0SFVxdxourP9SdV2u8UoAVTu7EUFgATlkK4z5ysQSDjM5wpHJZgG2gIxTsZTia4lfn93LwQchpZ4jAzt5fj0YoqELudnYLhpg8eKr8=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR07MB2247;
 20:ItjztmKc9TkQRE2DkOibfln2Qu/FGtdJHcj4xbiO9s69C8le9CkD5AunDgXZsTCjrXtsGmrRX9XAahw6zZVpuPSCxidJRdSCazFsMXXyGh6ILwKMgpq1Zp7w4TCpUJxY8aJjjMi9W0LVg5SMlEsW8VBT8vu/GvbHVlZoUic8FXYAAYyCTQ9lh5ryb2Z4OqHh62R+rEl2NZrUMVkbZofwokRSVCLksZmGnEli10cm6Y+CR461ckd3W4L6pwav9D6M
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2019 21:09:14.2181 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ae04bc-5050-4f2c-1520-08d69909ffca
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2247
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-22_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902220144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_130921_952052_0FC6AC48 
X-CRM114-Status: GOOD (  25.48  )
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
Cc: linux-i3c@lists.infradead.org, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Thank you for the review.

The 02/22/2019 16:30, Boris Brezillon wrote:
> 
> 
> On Mon, 18 Feb 2019 13:08:43 +0000
> Przemyslaw Gaj <pgaj@cadence.com> wrote:
> 
> > This patch adds support for mastership request to I3C subsystem.
> > 
> > Mastership event is enabled globally.
> > 
> > Mastership is requested automatically when device driver
> > tries to transfer data using master controller in slave mode.
> > 
> > There is still some limitation:
> > - I2C devices are registered on secondary master side if boardinfo
> > entry matching the info transmitted through the DEFSLVS frame.
> > 
> > Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> 
> Next time, please add the changelog after a --- delimiter so that it
> does not appear when I apply the patch.
>

Got it.

> > 
> > Main changes between v2 and v3:
> > - Add i3c_bus_downgrade_maintenance_lock() for downgrading the bus
> > lock from maintenance to normal use
> > - Add additional fields to i2c_dev_desc for DEFSLVS purpose (addr, lvr)
> > - Add i3c_master_register_new_i2c_devs() function to register I2C devices
> > - Reworked I2C devices registration on secondary master side
> > 
> > Changes in v2:
> > - Add mastership disable event hook
> > - Changed name of mastership enable event hook
> > - Add function to test if master owns the bus
> > - Removed op_mode
> > - Changed parameter of i3c_master_get_accmst_locked, no need to
> > pass full i3c_device_info
> > - Removed redundant DEFSLVS command before GETACCMST
> > - Add i3c_master_bus_takeover function. There is a need to lock
> > the bus before adding devices and no matter of the controller
> > devices have to be added after mastership takeover.
> > - Add device registration during initialization on secondary master
> > side. Devices received by DEFSLVS (if occured). If not, device
> > initialization is deffered untill next mastership request.
> > ---
> >  drivers/i3c/device.c       |  47 +++++
> >  drivers/i3c/internals.h    |   4 +
> >  drivers/i3c/master.c       | 428 +++++++++++++++++++++++++++++++++++++--------
> >  include/linux/i3c/master.h |  22 +++
> >  4 files changed, 427 insertions(+), 74 deletions(-)
> > 
> > diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> > index 69cc040..f53d689 100644
> > --- a/drivers/i3c/device.c
> > +++ b/drivers/i3c/device.c
> > @@ -43,6 +43,17 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
> >  	}
> >  
> >  	i3c_bus_normaluse_lock(dev->bus);
> > +	if (!i3c_master_owns_bus_locked(dev->desc->common.master)) {
> > +		i3c_bus_normaluse_unlock(dev->bus);
> > +		i3c_bus_maintenance_lock(dev->bus);
> > +		ret = i3c_master_request_mastership_locked(dev->desc->common.master);
> > +		if (ret) {
> > +			i3c_bus_maintenance_unlock(dev->bus);
> > +			return ret;
> > +		}
> > +		i3c_bus_downgrade_maintenance_lock(dev->bus);
> > +	}
> > +
> 
> Looks like this code check is duplicated, please create a helper
> (i3c_master_acquire_bus_ownership()?).
> 

Sure.

> >  	ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
> >  	i3c_bus_normaluse_unlock(dev->bus);
> >  
> > @@ -114,6 +125,17 @@ int i3c_device_enable_ibi(struct i3c_device *dev)
> >  	int ret = -ENOENT;
> >  
> >  	i3c_bus_normaluse_lock(dev->bus);
> > +	if (!i3c_master_owns_bus_locked(dev->desc->common.master)) {
> > +		i3c_bus_normaluse_unlock(dev->bus);
> > +		i3c_bus_maintenance_lock(dev->bus);
> > +		ret = i3c_master_request_mastership_locked(dev->desc->common.master);
> > +		if (ret) {
> > +			i3c_bus_maintenance_unlock(dev->bus);
> > +			return ret;
> > +		}
> > +		i3c_bus_downgrade_maintenance_lock(dev->bus);
> > +	}
> > +
> >  	if (dev->desc) {
> >  		mutex_lock(&dev->desc->ibi_lock);
> >  		ret = i3c_dev_enable_ibi_locked(dev->desc);
> > @@ -145,6 +167,18 @@ int i3c_device_request_ibi(struct i3c_device *dev,
> >  		return -EINVAL;
> >  
> >  	i3c_bus_normaluse_lock(dev->bus);
> > +
> > +	if (!i3c_master_owns_bus_locked(dev->desc->common.master)) {
> > +		i3c_bus_normaluse_unlock(dev->bus);
> > +		i3c_bus_maintenance_lock(dev->bus);
> > +		ret = i3c_master_request_mastership_locked(dev->desc->common.master);
> > +		if (ret) {
> > +			i3c_bus_maintenance_unlock(dev->bus);
> > +			return ret;
> > +		}
> > +		i3c_bus_downgrade_maintenance_lock(dev->bus);
> > +	}
> > +
> >  	if (dev->desc) {
> >  		mutex_lock(&dev->desc->ibi_lock);
> >  		ret = i3c_dev_request_ibi_locked(dev->desc, req);
> > @@ -166,7 +200,20 @@ EXPORT_SYMBOL_GPL(i3c_device_request_ibi);
> >   */
> >  void i3c_device_free_ibi(struct i3c_device *dev)
> >  {
> > +	int ret;
> > +
> >  	i3c_bus_normaluse_lock(dev->bus);
> > +	if (!i3c_master_owns_bus_locked(dev->desc->common.master)) {
> > +		i3c_bus_normaluse_unlock(dev->bus);
> > +		i3c_bus_maintenance_lock(dev->bus);
> > +		ret = i3c_master_request_mastership_locked(dev->desc->common.master);
> > +		if (ret) {
> > +			i3c_bus_maintenance_unlock(dev->bus);
> > +			return;
> > +		}
> > +		i3c_bus_downgrade_maintenance_lock(dev->bus);
> > +	}
> > +
> >  	if (dev->desc) {
> >  		mutex_lock(&dev->desc->ibi_lock);
> >  		i3c_dev_free_ibi_locked(dev->desc);
> > diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> > index 86b7b44..7e9f1fb 100644
> > --- a/drivers/i3c/internals.h
> > +++ b/drivers/i3c/internals.h
> > @@ -14,6 +14,10 @@ extern struct bus_type i3c_bus_type;
> >  
> >  void i3c_bus_normaluse_lock(struct i3c_bus *bus);
> >  void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
> > +void i3c_bus_downgrade_maintenance_lock(struct i3c_bus *bus);
> > +bool i3c_master_owns_bus_locked(struct i3c_master_controller *master);
> > +int i3c_master_request_mastership_locked(struct i3c_master_controller *master);
> > +
> >  
> >  int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> >  				 struct i3c_priv_xfer *xfers,
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 2dc628d..14493e5 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -38,10 +38,11 @@ static DEFINE_MUTEX(i3c_core_lock);
> >   * logic to rely on I3C device information that could be changed behind their
> >   * back.
> >   */
> > -static void i3c_bus_maintenance_lock(struct i3c_bus *bus)
> > +void i3c_bus_maintenance_lock(struct i3c_bus *bus)
> >  {
> >  	down_write(&bus->lock);
> >  }
> > +EXPORT_SYMBOL_GPL(i3c_bus_maintenance_lock);
> >  
> >  /**
> >   * i3c_bus_maintenance_unlock - Release the bus lock after a maintenance
> > @@ -52,10 +53,11 @@ static void i3c_bus_maintenance_lock(struct i3c_bus *bus)
> >   * i3c_bus_maintenance_lock() for more details on what these maintenance
> >   * operations are.
> >   */
> > -static void i3c_bus_maintenance_unlock(struct i3c_bus *bus)
> > +void i3c_bus_maintenance_unlock(struct i3c_bus *bus)
> >  {
> >  	up_write(&bus->lock);
> >  }
> > +EXPORT_SYMBOL_GPL(i3c_bus_maintenance_unlock);
> 
> This should be done in a separate patch explaining why you need to
> export those funcs. Also, functions defined in drivers/i3c/internals.h
> should never be exported. If the function is about to be used by master
> controller drivers, it should be defined in include/linux/i3c/master.h.
> 

Ok.

> >  
> >  /**
> >   * i3c_bus_normaluse_lock - Lock the bus for a normal operation
> > @@ -91,6 +93,20 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
> >  	up_read(&bus->lock);
> >  }
> >  
> > +/**
> > + * i3c_bus_downgrade_maintenance_lock - Downgrade the bus lock to normal
> > + * operation
> > + * @bus: I3C bus to downgrade the lock on
> > + *
> > + * Should be called when a maintenance operation is done and normal
> > + * operation is planned. See i3c_bus_maintenance_lock() and
> > + * i3c_bus_normaluse_lock() for more details.
> > + */
> > +void i3c_bus_downgrade_maintenance_lock(struct i3c_bus *bus)
> > +{
> > +	downgrade_write(&bus->lock);
> > +}
> > +
> >  static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
> >  {
> >  	return container_of(dev, struct i3c_master_controller, dev);
> > @@ -339,6 +355,22 @@ static int i3c_device_probe(struct device *dev)
> >  	return driver->probe(i3cdev);
> >  }
> >  
> > +static void i3c_master_enable_mr_events(struct i3c_master_controller *master)
> > +{
> > +	if (!master->ops->enable_mr_events)
> > +		return;
> > +
> > +	master->ops->enable_mr_events(master);
> > +}
> > +
> > +static void i3c_master_disable_mr_events(struct i3c_master_controller *master)
> > +{
> > +	if (!master->ops->disable_mr_events)
> > +		return;
> > +
> > +	master->ops->disable_mr_events(master);
> > +}
> > +
> >  static int i3c_device_remove(struct device *dev)
> >  {
> >  	struct i3c_device *i3cdev = dev_to_i3cdev(dev);
> > @@ -460,6 +492,23 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
> >  	return 0;
> >  }
> >  
> > +int i3c_master_request_mastership_locked(struct i3c_master_controller *master)
> > +{
> > +	if (WARN_ON(master->init_done &&
> > +	    !rwsem_is_locked(&master->bus.lock)))
> > +		return -EINVAL;
> > +
> > +	if (!master->ops->request_mastership)
> > +		return -ENOTSUPP;
> > +
> > +	return master->ops->request_mastership(master);
> > +}
> > +
> > +bool i3c_master_owns_bus_locked(struct i3c_master_controller *master)
> > +{
> > +	return master->bus.cur_master == master->this;
> > +}
> 
> If you create the i3c_master_acquire_bus_ownership() helper, you
> should need i3c_master_owns_bus_locked().

Should or shouldn't? :-)

> 
> > +
> >  static const char * const i3c_bus_mode_strings[] = {
> >  	[I3C_BUS_MODE_PURE] = "pure",
> >  	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
> > @@ -618,6 +667,25 @@ i3c_master_alloc_i2c_dev(struct i3c_master_controller *master,
> >  
> >  	dev->common.master = master;
> >  	dev->boardinfo = boardinfo;
> > +	dev->addr = boardinfo->base.addr;
> > +	dev->lvr = boardinfo->lvr;
> 
> Please do that in a separate patch (I mean, the part that adds ->lvr
> and ->addr fields to the i3c_dev_desc object).
> 

Ok.

> > +
> > +	return dev;
> > +}
> > +
> > +static struct i2c_dev_desc *
> > +i3c_master_alloc_i2c_dev_no_boardinfo(struct i3c_master_controller *master,
> > +				      u16 addr, u8 lvr)
> > +{
> > +	struct i2c_dev_desc *dev;
> > +
> > +	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> > +	if (!dev)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	dev->common.master = master;
> > +	dev->addr = addr;
> > +	dev->lvr = lvr;
> >  
> >  	return dev;
> >  }
> > @@ -691,6 +759,9 @@ i3c_master_find_i2c_dev_by_addr(const struct i3c_master_controller *master,
> >  	struct i2c_dev_desc *dev;
> >  
> >  	i3c_bus_for_each_i2cdev(&master->bus, dev) {
> > +		if (!dev->boardinfo)
> > +			continue;
> > +
> >  		if (dev->boardinfo->base.addr == addr)
> >  			return dev;
> >  	}
> > @@ -937,8 +1008,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master)
> >  
> >  	desc = defslvs->slaves;
> >  	i3c_bus_for_each_i2cdev(bus, i2cdev) {
> > -		desc->lvr = i2cdev->boardinfo->lvr;
> > -		desc->static_addr = i2cdev->boardinfo->base.addr << 1;
> > +		desc->lvr = i2cdev->lvr;
> > +		desc->static_addr = i2cdev->addr << 1;
> >  		desc++;
> >  	}
> >  
> > @@ -1490,6 +1561,83 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
> >  	}
> >  }
> >  
> > +static struct i2c_dev_boardinfo *
> > +i3c_master_find_i2c_boardinfo(const struct i3c_master_controller *master,
> > +			      u16 addr, u8 lvr)
> > +{
> > +	struct i2c_dev_boardinfo *i2cboardinfo;
> > +
> > +	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node) {
> > +		if (i2cboardinfo->base.addr == addr &&
> > +		    i2cboardinfo->lvr == lvr)
> > +			return i2cboardinfo;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +static void
> > +i3c_master_register_new_i2c_devs(struct i3c_master_controller *master)
> > +{
> > +	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
> > +	struct i2c_dev_desc *i2cdev;
> > +
> > +	if (!master->init_done)
> > +		return;
> > +
> > +	i3c_bus_for_each_i2cdev(&master->bus, i2cdev) {
> > +		if (i2cdev->dev)
> > +			continue;
> > +
> > +		if (!i2cdev->boardinfo)
> > +			continue;
> > +
> > +		i2cdev->dev = i2c_new_device(adap, &i2cdev->boardinfo->base);
> > +	}
> > +}
> > +
> > +/**
> > + * i3c_master_get_accmst_locked() - send a GETACCMST CCC command
> > + * @master: master used to send frames on the bus
> > + * @info: I3C device information
> > + *
> > + * Send a GETACCMST CCC command.
> > + *
> > + * This should be called if the curent master acknowledges bus takeover.
> > + *
> > + * This function must be called with the bus lock held in write mode.
> > + *
> > + * Return: 0 in case of success, a positive I3C error code if the error is
> > + * one of the official Mx error codes, and a negative error code otherwise.
> > + */
> > +int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
> > +				 u8 addr)
> > +{
> > +	struct i3c_ccc_getaccmst *accmst;
> > +	struct i3c_ccc_cmd_dest dest;
> > +	struct i3c_ccc_cmd cmd;
> > +	int ret;
> > +
> > +	accmst = i3c_ccc_cmd_dest_init(&dest, addr, sizeof(*accmst));
> > +	if (!accmst)
> > +		return -ENOMEM;
> > +
> > +	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETACCMST, &dest, 1);
> > +
> > +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> > +	if (ret)
> > +		goto out;
> > +
> > +	if (dest.payload.len != sizeof(*accmst))
> > +		ret = -EIO;
> > +
> > +out:
> > +	i3c_ccc_cmd_dest_cleanup(&dest);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_get_accmst_locked);
> > +
> >  /**
> >   * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
> >   * @master: master doing the DAA
> > @@ -1554,12 +1702,9 @@ int i3c_master_set_info(struct i3c_master_controller *master,
> >  	struct i3c_dev_desc *i3cdev;
> >  	int ret;
> >  
> > -	if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
> > -		return -EINVAL;
> > -
> > -	if (I3C_BCR_DEVICE_ROLE(info->bcr) == I3C_BCR_I3C_MASTER &&
> > -	    master->secondary)
> > -		return -EINVAL;
> > +	if (!master->secondary)
> > +		if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
> > +			return -EINVAL;
> 
> Please, add curly braces around the first if block. Also, why don't you
> check if the address is valid in that case?

I should. Again, I left this because it was valid for the early version.
I'll check if address is valid in case of both main and secondary ceontrollers.

> 
> >  
> >  	if (master->this)
> >  		return -EINVAL;
> > @@ -1605,43 +1750,13 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
> >  				 common.node) {
> >  		i3c_master_detach_i2c_dev(i2cdev);
> >  		i3c_bus_set_addr_slot_status(&master->bus,
> > -					i2cdev->boardinfo->base.addr,
> > -					I3C_ADDR_SLOT_FREE);
> > +					     i2cdev->addr,
> > +					     I3C_ADDR_SLOT_FREE);
> >  		i3c_master_free_i2c_dev(i2cdev);
> >  	}
> >  }
> >  
> > -/**
> > - * i3c_master_bus_init() - initialize an I3C bus
> > - * @master: main master initializing the bus
> > - *
> > - * This function is following all initialisation steps described in the I3C
> > - * specification:
> > - *
> > - * 1. Attach I2C and statically defined I3C devs to the master so that the
> > - *    master can fill its internal device table appropriately
> > - *
> > - * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
> > - *    the master controller. That's usually where the bus mode is selected
> > - *    (pure bus or mixed fast/slow bus)
> > - *
> > - * 3. Instruct all devices on the bus to drop their dynamic address. This is
> > - *    particularly important when the bus was previously configured by someone
> > - *    else (for example the bootloader)
> > - *
> > - * 4. Disable all slave events.
> > - *
> > - * 5. Pre-assign dynamic addresses requested by the FW with SETDASA for I3C
> > - *    devices that have a static address
> > - *
> > - * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
> > - *    remaining I3C devices
> > - *
> > - * Once this is done, all I3C and I2C devices should be usable.
> > - *
> > - * Return: a 0 in case of success, an negative error code otherwise.
> > - */
> > -static int i3c_master_bus_init(struct i3c_master_controller *master)
> > +static int i3c_master_attach_static_devs(struct i3c_master_controller *master)
> >  {
> >  	enum i3c_addr_slot_status status;
> >  	struct i2c_dev_boardinfo *i2cboardinfo;
> > @@ -1650,32 +1765,24 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> >  	struct i2c_dev_desc *i2cdev;
> >  	int ret;
> >  
> > -	/*
> > -	 * First attach all devices with static definitions provided by the
> > -	 * FW.
> > -	 */
> >  	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node) {
> >  		status = i3c_bus_get_addr_slot_status(&master->bus,
> >  						      i2cboardinfo->base.addr);
> > -		if (status != I3C_ADDR_SLOT_FREE) {
> > -			ret = -EBUSY;
> > -			goto err_detach_devs;
> > -		}
> > +		if (status != I3C_ADDR_SLOT_FREE)
> > +			return -EBUSY;
> >  
> >  		i3c_bus_set_addr_slot_status(&master->bus,
> >  					     i2cboardinfo->base.addr,
> >  					     I3C_ADDR_SLOT_I2C_DEV);
> >  
> >  		i2cdev = i3c_master_alloc_i2c_dev(master, i2cboardinfo);
> > -		if (IS_ERR(i2cdev)) {
> > -			ret = PTR_ERR(i2cdev);
> > -			goto err_detach_devs;
> > -		}
> > +		if (IS_ERR(i2cdev))
> > +			return PTR_ERR(i2cdev);
> >  
> >  		ret = i3c_master_attach_i2c_dev(master, i2cdev);
> >  		if (ret) {
> >  			i3c_master_free_i2c_dev(i2cdev);
> > -			goto err_detach_devs;
> > +			return ret;
> >  		}
> >  	}
> >  	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> > @@ -1685,28 +1792,71 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> >  
> >  		if (i3cboardinfo->init_dyn_addr) {
> >  			status = i3c_bus_get_addr_slot_status(&master->bus,
> > -						i3cboardinfo->init_dyn_addr);
> > -			if (status != I3C_ADDR_SLOT_FREE) {
> > -				ret = -EBUSY;
> > -				goto err_detach_devs;
> > -			}
> > +							      i3cboardinfo->init_dyn_addr);
> > +			if (status != I3C_ADDR_SLOT_FREE)
> > +				return -EBUSY;
> >  		}
> >  
> >  		i3cdev = i3c_master_alloc_i3c_dev(master, &info);
> > -		if (IS_ERR(i3cdev)) {
> > -			ret = PTR_ERR(i3cdev);
> > -			goto err_detach_devs;
> > -		}
> > +		if (IS_ERR(i3cdev))
> > +			return PTR_ERR(i3cdev);
> >  
> >  		i3cdev->boardinfo = i3cboardinfo;
> >  
> >  		ret = i3c_master_attach_i3c_dev(master, i3cdev);
> >  		if (ret) {
> >  			i3c_master_free_i3c_dev(i3cdev);
> > -			goto err_detach_devs;
> > +			return ret;
> >  		}
> >  	}
> >  
> > +	return 0;
> > +}
> > +
> > +/**
> > + * i3c_master_bus_init() - initialize an I3C bus
> > + * @master: main master initializing the bus
> > + *
> > + * This function is following all initialisation steps described in the I3C
> > + * specification:
> > + *
> > + * 1. Attach I2C and statically defined I3C devs to the master so that the
> > + *    master can fill its internal device table appropriately
> > + *
> > + * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
> > + *    the master controller. That's usually where the bus mode is selected
> > + *    (pure bus or mixed fast/slow bus)
> > + *
> > + * 3. Instruct all devices on the bus to drop their dynamic address. This is
> > + *    particularly important when the bus was previously configured by someone
> > + *    else (for example the bootloader)
> > + *
> > + * 4. Disable all slave events.
> > + *
> > + * 5. Pre-assign dynamic addresses requested by the FW with SETDASA for I3C
> > + *    devices that have a static address
> > + *
> > + * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
> > + *    remaining I3C devices
> > + *
> > + * Once this is done, all I3C and I2C devices should be usable.
> > + *
> > + * Return: a 0 in case of success, an negative error code otherwise.
> > + */
> > +static int i3c_master_bus_init(struct i3c_master_controller *master)
> > +{
> > +	struct i3c_dev_desc *i3cdev;
> > +	int ret;
> > +
> > +	/*
> > +	 * First attach all devices with static definitions provided by the
> > +	 * FW.
> > +	 */
> > +	if (!master->secondary) {
> > +		ret = i3c_master_attach_static_devs(master);
> > +		if (ret)
> > +			goto err_detach_devs;
> > +	}
> >  	/*
> >  	 * Now execute the controller specific ->bus_init() routine, which
> >  	 * might configure its internal logic to match the bus limitations.
> > @@ -1727,6 +1877,13 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> >  	}
> >  
> >  	/*
> > +	 * Don't reset addresses if this is secondary master.
> > +	 * Secondary masters can't do DAA.
> > +	 */
> > +	if (master->secondary)
> > +		return 0;
> > +
> > +	/*
> >  	 * Reset all dynamic address that may have been assigned before
> >  	 * (assigned by the bootloader for example).
> >  	 */
> > @@ -1789,6 +1946,56 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
> >  	return NULL;
> >  }
> >  
> > +int i3c_master_add_i2c_dev(struct i3c_master_controller *master,
> > +			   u16 addr, u8 lvr)
> > +{
> > +	enum i3c_addr_slot_status status;
> > +	struct i2c_dev_boardinfo *boardinfo;
> > +	struct i2c_dev_desc *i2cdev;
> > +	int ret;
> > +
> > +	if (!master)
> > +		return -EINVAL;
> > +
> > +	status = i3c_bus_get_addr_slot_status(&master->bus,
> > +					      addr);
> > +	if (status != I3C_ADDR_SLOT_FREE)
> > +		return -EBUSY;
> > +
> > +	i3c_bus_set_addr_slot_status(&master->bus, addr,
> > +				     I3C_ADDR_SLOT_I2C_DEV);
> > +
> > +	i2cdev = i3c_master_alloc_i2c_dev_no_boardinfo(master, addr, lvr);
> > +	if (IS_ERR(i2cdev)) {
> > +		ret = PTR_ERR(i2cdev);
> > +		goto err_free_dev;
> > +	}
> > +
> > +	boardinfo = i3c_master_find_i2c_boardinfo(master, addr, lvr);
> > +	if (!boardinfo) {
> > +		ret = -ENODEV;
> > +		goto err_free_dev;
> > +	}
> 
> Don't you need to keep the i2c_dev_desc around even if there's no
> boardinfo associated to it? I thought you had to do that to be able to
> send DEFSLVS when the secondary master receives a H-J request and needs
> to send a new DEFSLVS frame.

Yes, my mistake. I shouldn't free up i2c_dev_desc. I added it during refactoring.
DEFSLVS frame doesn't look good now.

> 
> > +
> > +	i2cdev->boardinfo = boardinfo;
> > +
> > +	ret = i3c_master_attach_i2c_dev(master, i2cdev);
> > +	if (ret) {
> > +		ret = PTR_ERR(i2cdev);
> > +		goto err_free_dev;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_free_dev:
> > +	i3c_bus_set_addr_slot_status(&master->bus, addr,
> > +				     I3C_ADDR_SLOT_FREE);
> > +	i3c_master_free_i2c_dev(i2cdev);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_add_i2c_dev);
> > +
> >  /**
> >   * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
> >   * @master: master used to send frames on the bus
> > @@ -2101,6 +2308,18 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
> >  	}
> >  
> >  	i3c_bus_normaluse_lock(&master->bus);
> > +	if (!i3c_master_owns_bus_locked(master)) {
> > +		i3c_bus_normaluse_unlock(&master->bus);
> > +		i3c_bus_maintenance_lock(&master->bus);
> > +
> > +		ret = i3c_master_request_mastership_locked(master);
> > +		if (ret) {
> > +			i3c_bus_maintenance_unlock(&master->bus);
> > +			return ret;
> > +		}
> > +		i3c_bus_downgrade_maintenance_lock(&master->bus);
> > +	}
> > +
> >  	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
> >  	if (!dev)
> >  		ret = -ENOENT;
> > @@ -2146,8 +2365,12 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
> >  	 * We silently ignore failures here. The bus should keep working
> >  	 * correctly even if one or more i2c devices are not registered.
> >  	 */
> > -	i3c_bus_for_each_i2cdev(&master->bus, i2cdev)
> > +	i3c_bus_for_each_i2cdev(&master->bus, i2cdev) {
> > +		if (!i2cdev->boardinfo)
> > +			continue;
> > +
> >  		i2cdev->dev = i2c_new_device(adap, &i2cdev->boardinfo->base);
> > +	}
> >  
> >  	return 0;
> >  }
> > @@ -2388,18 +2611,43 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
> >  	     !ops->recycle_ibi_slot))
> >  		return -EINVAL;
> >  
> > +	if (ops->request_mastership &&
> > +	    (!ops->enable_mr_events || !ops->disable_mr_events))
> > +		return -EINVAL;
> > +
> >  	return 0;
> >  }
> >  
> >  /**
> > + * i3c_master_bus_takeover() - register new I3C devices on bus takeover
> > + * @master: master used to send frames on the bus
> > + *
> > + * This function is useful when devices were not added
> > + * during initialization or when new device joined the bus
> > + * which was under control of different master.
> > + */
> > +void i3c_master_bus_takeover(struct i3c_master_controller *master)
> 
> Seems like the name does not match what the function does. How about
> i3c_master_register_new_devs(). The fact that it's call when a
> secondary master acquires the bus is just a detail.

Yes, it made sense before, but not now. I'll change the name.

> 
> > +{
> > +	/*
> > +	 * We can register I3C devices received from master by DEFSLVS.
> > +	 */
> > +	i3c_bus_normaluse_lock(&master->bus);
> > +	i3c_master_register_new_i3c_devs(master);
> > +	i3c_bus_normaluse_unlock(&master->bus);
> > +
> > +	i3c_bus_normaluse_lock(&master->bus);
> > +	i3c_master_register_new_i2c_devs(master);
> > +	i3c_bus_normaluse_unlock(&master->bus);
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_bus_takeover);
> > +
> > +/**
> >   * i3c_master_register() - register an I3C master
> >   * @master: master used to send frames on the bus
> >   * @parent: the parent device (the one that provides this I3C master
> >   *	    controller)
> >   * @ops: the master controller operations
> > - * @secondary: true if you are registering a secondary master. Will return
> > - *	       -ENOTSUPP if set to true since secondary masters are not yet
> > - *	       supported
> > + * @secondary: true if you are registering a secondary master.
> >   *
> >   * This function takes care of everything for you:
> >   *
> > @@ -2422,10 +2670,6 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  	struct i2c_dev_boardinfo *i2cbi;
> >  	int ret;
> >  
> > -	/* We do not support secondary masters yet. */
> > -	if (secondary)
> > -		return -ENOTSUPP;
> > -
> >  	ret = i3c_master_check_ops(ops);
> >  	if (ret)
> >  		return ret;
> > @@ -2503,6 +2747,14 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  	i3c_master_register_new_i3c_devs(master);
> >  	i3c_bus_normaluse_unlock(&master->bus);
> >  
> > +	i3c_bus_normaluse_lock(&master->bus);
> > +	i3c_master_register_new_i2c_devs(master);
> > +	i3c_bus_normaluse_unlock(&master->bus);
> 
> You could call i3c_master_register_new_devs() here instead of
> duplicating the code.
> 
> > +
> > +	i3c_bus_maintenance_lock(&master->bus);
> > +	i3c_master_enable_mr_events(master);
> > +	i3c_bus_maintenance_unlock(&master->bus);
> 
> We might want to make that configurable per-bus using a DT prop (or a
> module param), but let's say we accept MR requests by default.
> 

Yes, we can add support for this. Adding it to my todo list :)

> > +
> >  	return 0;
> >  
> >  err_del_dev:
> > @@ -2519,6 +2771,30 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  EXPORT_SYMBOL_GPL(i3c_master_register);
> >  
> >  /**
> > + * i3c_master_mastership_ack() - performs operations before bus handover.
> > + * @master: master used to send frames on the bus
> > + * @addr: I3C device address
> > + *
> > + * Basically, it sends DEFSLVS command to ensure new master is taking
> > + * the bus with complete list of devices and then acknowledges bus takeover.
> > + *
> > + * Return: 0 in case of success, a negative error code otherwise.
> > + */
> > +int i3c_master_mastership_ack(struct i3c_master_controller *master,
> > +			      u8 addr)
> > +{
> > +	int ret;
> > +
> > +	i3c_bus_maintenance_lock(&master->bus);
> > +	ret = i3c_master_get_accmst_locked(master, addr);
> > +	i3c_bus_maintenance_unlock(&master->bus);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_mastership_ack);
> > +
> > +
> > +/**
> >   * i3c_master_unregister() - unregister an I3C master
> >   * @master: master used to send frames on the bus
> >   *
> > @@ -2528,6 +2804,10 @@ EXPORT_SYMBOL_GPL(i3c_master_register);
> >   */
> >  int i3c_master_unregister(struct i3c_master_controller *master)
> >  {
> > +	i3c_bus_maintenance_lock(&master->bus);
> > +	i3c_master_disable_mr_events(master);
> > +	i3c_bus_maintenance_unlock(&master->bus);
> > +
> >  	i3c_master_i2c_adapter_cleanup(master);
> >  	i3c_master_unregister_i3c_devs(master);
> >  	i3c_master_bus_cleanup(master);
> > diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> > index f13fd8b..8514680 100644
> > --- a/include/linux/i3c/master.h
> > +++ b/include/linux/i3c/master.h
> > @@ -84,6 +84,8 @@ struct i2c_dev_desc {
> >  	struct i3c_i2c_dev_desc common;
> >  	const struct i2c_dev_boardinfo *boardinfo;
> >  	struct i2c_client *dev;
> > +	u16 addr;
> > +	u8 lvr;
> >  };
> >  
> >  /**
> > @@ -418,6 +420,12 @@ struct i3c_bus {
> >   *		      for a future IBI
> >   *		      This method is mandatory only if ->request_ibi is not
> >   *		      NULL.
> > + * @request_mastership: requests bus mastership. Mastership is requested
> > + *                      automatically when device driver wants to transfer
> > + *                      data using master in slave mode.
> > + * @enable_mr_events: enable the Mastership event.
> > + *                    Mastership does not require handler.
> > + * @disable_mr_events: disable the Mastership event.
> >   */
> >  struct i3c_master_controller_ops {
> >  	int (*bus_init)(struct i3c_master_controller *master);
> > @@ -445,6 +453,10 @@ struct i3c_master_controller_ops {
> >  	int (*disable_ibi)(struct i3c_dev_desc *dev);
> >  	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
> >  				 struct i3c_ibi_slot *slot);
> > +	void (*update_devs)(struct i3c_master_controller *master);
> 
> Undocumented hook (I'm not even sure you're using it in the code).
> 

I'm not. Impact of the previous version.

> > +	int (*request_mastership)(struct i3c_master_controller *master);
> > +	int (*enable_mr_events)(struct i3c_master_controller *master);
> > +	int (*disable_mr_events)(struct i3c_master_controller *master);
> >  };
> >  
> >  /**
> > @@ -524,6 +536,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master);
> >  int i3c_master_get_free_addr(struct i3c_master_controller *master,
> >  			     u8 start_addr);
> >  
> > +int i3c_master_add_i2c_dev(struct i3c_master_controller *master,
> > +			   u16 addr, u8 lvr);
> >  int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> >  				  u8 addr);
> >  int i3c_master_do_daa(struct i3c_master_controller *master);
> > @@ -536,6 +550,11 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  			const struct i3c_master_controller_ops *ops,
> >  			bool secondary);
> >  int i3c_master_unregister(struct i3c_master_controller *master);
> > +int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
> > +				 u8 addr);
> > +int i3c_master_mastership_ack(struct i3c_master_controller *master,
> > +			      u8 addr);
> > +void i3c_master_bus_takeover(struct i3c_master_controller *master);
> >  
> >  /**
> >   * i3c_dev_get_master_data() - get master private data attached to an I3C
> > @@ -645,4 +664,7 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
> >  
> >  struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
> >  
> > +void i3c_bus_maintenance_lock(struct i3c_bus *bus);
> > +void i3c_bus_maintenance_unlock(struct i3c_bus *bus);
> > +
> >  #endif /* I3C_MASTER_H */
> 

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
