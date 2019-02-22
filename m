Return-Path: <SRS0=3YcD=Q5=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028CCC43381
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Feb 2019 15:03:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE996206A3
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Feb 2019 15:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a9dEmEiH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="GNwPp+n7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="jFycZUJe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE996206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4086tIU5d13Ppaxjt8uXt+nXhlL/B9eIsTNNJADWUKY=; b=a9dEmEiHm1akaA
	5WW0jqZH4SLVjYHyTTdxPXo5rlqhjLOx8Bm9NPoD5fjdm0XjqrmJjnW1pSs6cMo1OlR3yCLbrowwP
	mrSy42t8VANWM/51EDlHnggTmn7b0vm8ClGNxOVWfvj6lJf5ABBff5i5Ls7Tzs/oaEeU+u9tnTvYo
	PaE+QSXBG6PN4KG5SurcXO803XBoC72lszumV5JxQmi8aio5KR0CqwZ4r2+xy6yNn0U3IxKGyRk6G
	JyJfi0HLhvH9AGCKwkO20c72SPMywj9iXbvZvolTDqM7a0FkR7N8NORr7b+zpksA23pYAs5f6KDeJ
	srPdppLp6JhLBa0qYhHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxCMH-0005O5-8g; Fri, 22 Feb 2019 15:03:25 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxCMB-0005NC-Vz
 for linux-i3c@lists.infradead.org; Fri, 22 Feb 2019 15:03:23 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1MF0Jv5027715; Fri, 22 Feb 2019 07:03:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=proofpoint;
 bh=6zv0M7FVsteRzSVTZ2+tjFu3Dd0qft84j1NQeov9zlo=;
 b=GNwPp+n700QucTormymt2tbyQ9WhkVi9FsG8w7nL1dDvNTwd+1zoHkMLrr3gClNHN6Ko
 qvHKrlEQ3zjMDiCA0MfkrVgRpDmZgr/2unjQiq0+fBF/mqaGXIfTuNYGUkjbTFfj/D4n
 V1Vtz1+KOe3Wdymjj5hPXlhpYlP/OfKZYBXdJVYmBFFhBpIclqXgrbsbcjCIsjR1XMdt
 NAHcRsn94lr8MsFp88P96HAV8/+yzCDF+o/y/P3yuu+SE7SpggJcUx3UtauM2vNae2uC
 mv4suQN0sY7X6LV7NaZnVHApQJhrH0DuFTvfikoQdqoYaRivi38Rs2nc8xzqQaN7HncY 2w== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2055.outbound.protection.outlook.com [104.47.45.55])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qspmmq4tf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 22 Feb 2019 07:03:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zv0M7FVsteRzSVTZ2+tjFu3Dd0qft84j1NQeov9zlo=;
 b=jFycZUJeF6taEB76hxyVedlNl6710hzWYJ0Zv/j8rjnLzweaWaSl9SKUrNeV83LaEJ+zVfxPDRSCkF1HNBObPfnhh1WW/P4ET0O+jRBrMIUi5zfqIlaxzXizF2wJ5QABRjiKu2Bvl7e9G6Na/Y2pyyq6yHo711pBthLarp9YMnE=
Received: from BYAPR07CA0102.namprd07.prod.outlook.com (2603:10b6:a03:12b::43)
 by CY4PR07MB3095.namprd07.prod.outlook.com (2603:10b6:903:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.18; Fri, 22 Feb
 2019 15:03:01 +0000
Received: from CO1NAM05FT034.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::202) by BYAPR07CA0102.outlook.office365.com
 (2603:10b6:a03:12b::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.16 via Frontend
 Transport; Fri, 22 Feb 2019 15:03:01 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT034.mail.protection.outlook.com (10.152.96.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1665.5 via Frontend Transport; Fri, 22 Feb 2019 15:02:59 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x1MF2rDS014645
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 22 Feb 2019 10:02:56 -0500
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 22 Feb 2019 07:02:51 -0800
Date: Fri, 22 Feb 2019 15:02:49 +0000
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH 1/2] i3c: Add support for HDR modes.
Message-ID: <20190222150248.GA28244@global.cadence.com>
References: <cover.1544702829.git.pgaj@cadence.com>
 <efb3b8692d3579ab3369cc0f80e237550f3e8209.1544702829.git.pgaj@cadence.com>
 <cb17ee91-bad8-03d4-cc9f-e7095cf17011@synopsys.com>
 <20190222155238.3dc4ab8f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190222155238.3dc4ab8f@kernel.org>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(39860400002)(346002)(136003)(2980300002)(189003)(199004)(36092001)(356004)(6286002)(53416004)(86362001)(229853002)(26826003)(316002)(1076003)(5660300002)(6916009)(8936002)(6246003)(50466002)(81166006)(8676002)(14444005)(5024004)(93886005)(2906002)(81156014)(186003)(107886003)(47776003)(486006)(126002)(33656002)(16526019)(55016002)(7736002)(426003)(4326008)(2870700001)(386003)(53546011)(66066001)(336012)(53936002)(956004)(105596002)(58126008)(23676004)(2486003)(7696005)(69596002)(478600001)(54906003)(106466001)(26005)(6116002)(11346002)(97736004)(561944003)(76176011)(476003)(3846002)(446003)(305945005)(18370500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR07MB3095; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:ErrorRetry; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23dddd9c-1aee-43dc-4a76-08d698d6d5ec
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR07MB3095; 
X-MS-TrafficTypeDiagnostic: CY4PR07MB3095:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR07MB3095;
 20:AbaoPp71iguo+enb+2HcueI1yPAlvVuRaY0uj1zFjGNwixoC35VXCC1z8lbILXonolFMncC13P3g8MVeWmoW1dVmn+vdUHuOCW88Lch6pFRePHb2dB8XiXZwXfmyLPvcQSdVjcdYvWRaxNrUMyGnvT2sQUGBdvkakehRzsEjZNY2ZqsigqGOA/bmnV/uvaRItTbYKkip8gQBjmw6SWhhbe08FFROmpMeNyeX5EgjiZQDaaQqfZBWOqhWFvBEndRJQLD31t9KpyqQkJdDeM04tK94NIUbNkyPYR4pMJbNrQGgllWVpawOjbh7zs3/SQ2v0OCMKoithIcW0bzM5Orergz7K+2G9QmQQC1JVTSuN4mONQMlTNX5qEhvM7ngMGGTlvkhKls3IiLIGFkk7ZbSQh2JHv0tHTlgm8mAKwl+ENIiT7ff0u7YNTDllQBlQsujG3Iep8gwqXgK99ey2P4z1ZXe6iyVMHPhqmNg4tCjdH+G/cV6wrh2tvJlUAk0q0s6
X-Microsoft-Antispam-PRVS: <CY4PR07MB3095BC8DB865AD885236D390C27F0@CY4PR07MB3095.namprd07.prod.outlook.com>
X-Forefront-PRVS: 09565527D6
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjA3TUIzMDk1OzIzOlFpU1Q4Y0J2aXcvL3F3MWQwUTRYMWFObk5l?=
 =?utf-8?B?NEhLbzJTQUh0VWNnR3VyL2hESGxaSXVIR2hDbUtrcDJKWll6OE9SbncxVTRS?=
 =?utf-8?B?K0lwSjhkWFFXajNMZzg0cElFZENVNVFndjltSmxIQmVCM3RBajhScUNBVUtZ?=
 =?utf-8?B?UzBkQkJJYm14Njk5Rm5HYTNMdExPNkxlOWpvQjBYcDBnbjJyY2hsd1dTdFhN?=
 =?utf-8?B?ZnlqWUlBODBRZUlWNENRSTl3SXRXdVl6RllKdzFQbWF0VzI1REtQSDVUYm1N?=
 =?utf-8?B?V05wemVPMWZqOHIzNUVzUWVQMlM2V0VlWUFnZGtoNXRHVEdpS2NiUVQyMGdI?=
 =?utf-8?B?aVA1VmxlYUJzblBLQXhTTm9WcUZ5Y0VyODg0TGhESFB5S2k1am1EQVdrdU9H?=
 =?utf-8?B?MjQzbkV5azgwM01zUWR2UVRXZXdMbnJlcG9LQ2pQeE9VbmYxTmZKTVphSzl6?=
 =?utf-8?B?LzA1N2tnalRLbVBMeWo1MWlZT2dZMEpKRmlFblVraEVQV3NoekpIUHY1eUV3?=
 =?utf-8?B?ZEZTSTFoWGpVcUYzNmdnWkVhTDR3eUt2VEtqQ3RZTWgyRHQzU3kreXNqN2pR?=
 =?utf-8?B?Wnh6dFFLbjZsYU9mRFo3eWF1V2swRktwWDgvVGNZWUNPYkg4Nk56Mk1SOEN5?=
 =?utf-8?B?cHhLblAzeVlBcERiWVZRdFloR3Y4NnpiYnE2RHNWcldFbDgwR1VwZDAwSjQ4?=
 =?utf-8?B?MWRXdSt4d0hmSEo2V0RFcnJlY0MrblhFcTNVZzFtVHFPcURUdWNPT290eHdx?=
 =?utf-8?B?S2czU0NUWjF0YXhab2ppdDBBdjBxcFdQUy9JbkQrTTRZdEViSkF3c3hNVFhm?=
 =?utf-8?B?ZXRTSSt3VXhHVnRmUUVZWkdGOHM4MjZNUGQwSm40VHRTcnJaNkllalJoRmEw?=
 =?utf-8?B?V3JMS0RNNjZTWXpSSElrM25TSkc3ZnRkS1doaHFrQldvUDhkRjlCa3dZRUxv?=
 =?utf-8?B?bWNvSzdMTVZkQzBRd1NGR0hCZ3l0eTRlK3VEZ0VLcmlvTWhMY01UMmpGaUtO?=
 =?utf-8?B?RXJwMnRiTGFqaFJHRU1mNzFIQzZIVjF1OWhnc3VrQkJiTFQyMWZBS3JjOWgz?=
 =?utf-8?B?Z3o1Ly83L0gyTHBmS2RqTGExWTlyVWI1N1FCekR5SEJzbzFIVElLYlNIdmto?=
 =?utf-8?B?RzIxcnJnRFQyZHpjYjQvVHQrb2c0cnlZTDQ3bXc2OXdSWTZrbjBiVFgyUUpR?=
 =?utf-8?B?Lytrd2N1bTQ3bllCREpUcVR1TFVYdDRnYTl6T1hvNHVQOU5WWkZsNGhtZm56?=
 =?utf-8?B?NmN1L2pjQTI2blBvQXo2aVZ6TmtMUkRwc0Uvb0p3UWZTUFpiaHNneVFNZVIr?=
 =?utf-8?B?bjVBdmxpbVlKbHpydkVyQWxmT3g5cnlVMWNvOUNHd3ExVHRrcHdGYzgzWUlY?=
 =?utf-8?B?VDlVSDgzcUVIVmJWMDUrQmlhOXpJRnNwN1pEb1VMNHkzc0ZwY0RITW1Oa3hB?=
 =?utf-8?B?MXlhUWEzazJtZGMrK2dndGhNdSt4L09zYjgyWDVRYVlMbGxBQSt6STFCdWdK?=
 =?utf-8?B?TGVjTkcrQmZJNWU5RmVWcW1FNDZoVlJqT0o2NWg0c3ZQSkpWZFN4SnhHM0Vv?=
 =?utf-8?B?RjB3L1dESlR0aFFKbm1qYkJoblNYaEErV3RsVm9GWUxKLzlBU3Ura1I2TnRh?=
 =?utf-8?B?M2cwaGxpcStIMGlrSGpOZFZOV21BeDRhcE1hekpMKzhpakMxRllNejB6K3E1?=
 =?utf-8?B?T3ZrWnAwNk83T3dldTBhRmllMWpyWkdDNkppUnREQk9XVFFQRDI4VS9sbFBK?=
 =?utf-8?B?MmpuT2xOZ29QOVZiTWtuOGNaZUsxbFMyTm5vQ1FmSXdCblQ3dk1KeWVHZ2xC?=
 =?utf-8?B?T3h5NXdtemhIMHFOa0NiRkcwZFV0KzNGUUt3d2FhYlpReHhtTmhHOU11eHpu?=
 =?utf-8?B?Z2p1cWx0dG14eWdUSDhVMnhrRDlKSzVEc1V5S0JqQXlwNERUOGIwbFNqN2h0?=
 =?utf-8?B?ZDdwMm8yell2S2hEWFJaZllib2NMQ2ZRNXJBOXF6RFlST3dqZGg5UldBUW5X?=
 =?utf-8?Q?RDJjxq?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: lJtji8FGp3J69x+V6P3RJxwVTwtvSgawJC0DoU2iCpDVq2T8V8Mz8DQgqAt2gJ1v1lUNZ8DkAhQy6JtjveSCGnuzI79U8S6PcB9S1htDqo4xo7nGtunH2V5yWWZ7F/ZW15FqfAHEF01Zj7KKlh/Ja1v1hashLTHoIpw+ZqcXRZheTEPnT4ovHprI4K56Wu2ooIx1B4vAbbUoeV58kaAP2b33AEv/9qkx05IRlc5LNyP1Fg1vIzdd1TtXeSdM+mQvQoWQXBB59wMAiuZUhKbba3GIgq4P3UZ7UEhPzOpmig2u9y+owVAfTxDigry3D9vxsb7mhQuK5iwKDlJFU/Ck9twn38+NyrOUnOiLMF/pFs5lKUbUyGxwBrd3bETGGr8Hr8IoWJwsc4v4v99YwOEZIc5zbt2qi906B4/0r1+4VfY=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR07MB3095;
 20:y/XPysyvJKZF98JuOmd7MwrOjpyWlZvpcaL/T9LUhhWGpioJeFAQVqPUM/+HNSs2ehIHTHctG/cRGMMq8JquyS4FkEG73uOKiKuqKlG6sonvuK7lqpPx74Sp0NadFZa5hCIgRTLqFq65Zyrs78Tw4HGVQjRfbR4dyBSvnKSu7ROqlsZdDBqwSJ90+hvV7uZSHk61XhIeFIbpxifghDP19qWG2oQSPe3JjVYRQ9EtL8sSF9p9tGC/PkPS2gJG23Fa
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2019 15:02:59.5967 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23dddd9c-1aee-43dc-4a76-08d698d6d5ec
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
 definitions=2019-02-22_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902220106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_070320_225063_6F90E2E1 
X-CRM114-Status: GOOD (  23.20  )
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
 vitor <vitor.soares@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

U29ycnkgZm9yIHRoZSBkZWxheS4gSXQgd2FzIG9uIG15IHRvZG8gbGlzdC4KClRoZSAwMi8yMi8y
MDE5IDE1OjUyLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gRVhURVJOQUwgTUFJTAo+IAo+IAo+
IE9uIFRodSwgMjEgRmViIDIwMTkgMTU6MTU6NTcgKzAwMDAKPiB2aXRvciA8dml0b3Iuc29hcmVz
QHN5bm9wc3lzLmNvbT4gd3JvdGU6Cj4gCj4gPiBIaSBQcnplbWVrLAo+ID4gCj4gPiBTb3JyeSBm
b3IgdGhlIGxhdGUgcmVzcG9uc2UuCj4gPiAKPiA+IE9uIDEzLzEyLzE4IDEyOjE4LCBQcnplbXlz
bGF3IEdhaiB3cm90ZToKPiA+ID4gSERSIChIaWdoIERhdGEgUmF0ZSkgbW9kZXMgaXMgYW4gaW1w
b3J0YW50IGZlYXR1cmUgb2YgdGhlIEkzQyBwcm90b2NvbAo+ID4gPiBhcyBpdCBhbGxvd3MgdG8g
Z2V0IGhpZ2hlciB0aHJvdWdocHV0IHRoYW4gd2l0aCB0aGUgU0RSIChTaW5nbGUgRGF0YQo+ID4g
PiBSYXRlKSBtb2RlLgo+ID4gPgo+ID4gPiBBZGQgbmV3IGNvbnRyb2xsZXIgaG9va3MgYW5kIGV4
dGVuZCB0aGUgSTNDIGRldmljZSBBUEkgdG8gZXhwb3NlIHRoaXMKPiA+ID4gbmV3IGZlYXR1cmUu
Cj4gPiA+Cj4gPiA+IFRoaXMgZmVhdHVyZSB3YXMgb3JpZ2luYWxseSBjcmVhdGVkIGJ5IEJvcmlz
IEJyZXppbGxvbgo+ID4gPiA8Ym9yaXMuYnJlemlsbG9uQGJvb3RsaW4uY29tPi4KPiA+ID4KPiA+
ID4gU2lnbmVkLW9mZi1ieTogUHJ6ZW15c2xhdyBHYWogPHBnYWpAY2FkZW5jZS5jb20+Cj4gPiA+
IC0tLQo+ID4gPiAgZHJpdmVycy9pM2MvZGV2aWNlLmMgICAgICAgfCAzNyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICBkcml2ZXJzL2kzYy9pbnRlcm5hbHMuaCAg
ICB8ICAzICsrKwo+ID4gPiAgZHJpdmVycy9pM2MvbWFzdGVyLmMgICAgICAgfCAzMSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICBpbmNsdWRlL2xpbnV4L2kzYy9kZXZpY2Uu
aCB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICBpbmNsdWRlL2xpbnV4
L2kzYy9tYXN0ZXIuaCB8ICA3ICsrKysrKysKPiA+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTA3IGlu
c2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL2RldmljZS5j
IGIvZHJpdmVycy9pM2MvZGV2aWNlLmMKPiA+ID4gaW5kZXggNjljYzA0MC4uOTc5MTBhYSAxMDA2
NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9pM2MvZGV2aWNlLmMKPiA+ID4gKysrIGIvZHJpdmVycy9p
M2MvZGV2aWNlLmMKPiA+ID4gQEAgLTUxLDYgKzUxLDQzIEBAIGludCBpM2NfZGV2aWNlX2RvX3By
aXZfeGZlcnMoc3RydWN0IGkzY19kZXZpY2UgKmRldiwKPiA+ID4gIEVYUE9SVF9TWU1CT0xfR1BM
KGkzY19kZXZpY2VfZG9fcHJpdl94ZmVycyk7Cj4gPiA+ICAKPiA+ID4gIC8qKgo+ID4gPiArICog
aTNjX2RldmljZV9zZW5kX2hkcl9jbWRzKCkgLSBzZW5kIEhEUiBjb21tYW5kcyB0byBhIHNwZWNp
ZmljIGRldmljZQo+ID4gPiArICoKPiA+ID4gKyAqIEBkZXY6IGRldmljZSB0byB3aGljaCB0aGVz
ZSBjb21tYW5kcyBzaG91bGQgYmUgc2VudAo+ID4gPiArICogQHhmZXJzOiBhcnJheSBvZiBjb21t
YW5kcwo+ID4gPiArICogQG54ZmVyczogbnVtYmVyIG9mIGNvbW1hbmRzCj4gPiA+ICsgKgo+ID4g
PiArICogU2VuZCBvbmUgb3Igc2V2ZXJhbCBIRFIgY29tbWFuZHMgdG8gQGRldi4KPiA+ID4gKyAq
Cj4gPiA+ICsgKiBUaGlzIGZ1bmN0aW9uIGNhbiBzbGVlcCBhbmQgdGh1cyBjYW5ub3QgYmUgY2Fs
bGVkIGluIGF0b21pYyBjb250ZXh0Lgo+ID4gPiArICoKPiA+ID4gKyAqIFJldHVybjogMCBpbiBj
YXNlIG9mIHN1Y2Nlc3MsIGEgbmVnYXRpdmUgZXJyb3IgY29yZSBvdGhlcndpc2UuCj4gPiA+ICsg
Ki8KPiA+ID4gK2ludCBpM2NfZGV2aWNlX3NlbmRfaGRyX2NtZHMoc3RydWN0IGkzY19kZXZpY2Ug
KmRldiwKPiA+ID4gKwkJCSAgICAgc3RydWN0IGkzY19oZHJfY21kICpjbWRzLAo+ID4gPiArCQkJ
ICAgICBpbnQgbmNtZHMpCj4gPiA+ICt7Cj4gPiA+ICsJaW50IHJldCwgaTsKPiA+ID4gKwllbnVt
IGkzY19oZHJfbW9kZSBtb2RlOwo+ID4gPiArCj4gPiA+ICsJaWYgKG5jbWRzIDwgMSkKPiA+ID4g
KwkJcmV0dXJuIDA7Cj4gPiA+ICsKPiA+ID4gKwltb2RlID0gY21kc1swXS5tb2RlOwo+ID4gPiAr
CWZvciAoaSA9IDE7IGkgPCBuY21kczsgaSsrKSB7Cj4gPiA+ICsJCWlmIChtb2RlICE9IGNtZHNb
aV0ubW9kZSkKPiA+ID4gKwkJCXJldHVybiAtRUlOVkFMOwo+ID4gPiArCX0KPiA+ID4gKwo+ID4g
PiArCWkzY19idXNfbm9ybWFsdXNlX2xvY2soZGV2LT5idXMpOwo+ID4gPiArCXJldCA9IGkzY19k
ZXZfc2VuZF9oZHJfY21kc19sb2NrZWQoZGV2LT5kZXNjLCBjbWRzLCBuY21kcyk7Cj4gPiA+ICsJ
aTNjX2J1c19ub3JtYWx1c2VfdW5sb2NrKGRldi0+YnVzKTsKPiA+ID4gKwo+ID4gPiArCXJldHVy
biByZXQ7Cj4gPiA+ICt9Cj4gPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChpM2NfZGV2aWNlX3NlbmRf
aGRyX2NtZHMpOwo+ID4gPiArCj4gPiA+ICsvKioKPiA+ID4gICAqIGkzY19kZXZpY2VfZ2V0X2lu
Zm8oKSAtIGdldCBJM0MgZGV2aWNlIGluZm9ybWF0aW9uCj4gPiA+ICAgKgo+ID4gPiAgICogQGRl
djogZGV2aWNlIHdlIHdhbnQgaW5mb3JtYXRpb24gb24KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaTNjL2ludGVybmFscy5oIGIvZHJpdmVycy9pM2MvaW50ZXJuYWxzLmgKPiA+ID4gaW5kZXgg
ODZiN2I0NC4uNDZjNGRlNyAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9pM2MvaW50ZXJuYWxz
LmgKPiA+ID4gKysrIGIvZHJpdmVycy9pM2MvaW50ZXJuYWxzLmgKPiA+ID4gQEAgLTE4LDYgKzE4
LDkgQEAgdm9pZCBpM2NfYnVzX25vcm1hbHVzZV91bmxvY2soc3RydWN0IGkzY19idXMgKmJ1cyk7
Cj4gPiA+ICBpbnQgaTNjX2Rldl9kb19wcml2X3hmZXJzX2xvY2tlZChzdHJ1Y3QgaTNjX2Rldl9k
ZXNjICpkZXYsCj4gPiA+ICAJCQkJIHN0cnVjdCBpM2NfcHJpdl94ZmVyICp4ZmVycywKPiA+ID4g
IAkJCQkgaW50IG54ZmVycyk7Cj4gPiA+ICtpbnQgaTNjX2Rldl9zZW5kX2hkcl9jbWRzX2xvY2tl
ZChzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYsCj4gPiA+ICsJCQkJIHN0cnVjdCBpM2NfaGRyX2Nt
ZCAqY21kcywKPiA+ID4gKwkJCQkgaW50IG5jbWRzKTsKPiA+ID4gIGludCBpM2NfZGV2X2Rpc2Fi
bGVfaWJpX2xvY2tlZChzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYpOwo+ID4gPiAgaW50IGkzY19k
ZXZfZW5hYmxlX2liaV9sb2NrZWQoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2KTsKPiA+ID4gIGlu
dCBpM2NfZGV2X3JlcXVlc3RfaWJpX2xvY2tlZChzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYsCj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci5jCj4gPiA+IGluZGV4IGU5OGI2MDAuLjE2ZDZkZDUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZl
cnMvaTNjL21hc3Rlci5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gPiA+IEBA
IC0yNzkxLDYgKzI3OTEsMzcgQEAgaW50IGkzY19kZXZfZG9fcHJpdl94ZmVyc19sb2NrZWQoc3Ry
dWN0IGkzY19kZXZfZGVzYyAqZGV2LAo+ID4gPiAgCXJldHVybiBtYXN0ZXItPm9wcy0+cHJpdl94
ZmVycyhkZXYsIHhmZXJzLCBueGZlcnMpOwo+ID4gPiAgfQo+ID4gPiAgCj4gPiA+ICtpbnQgaTNj
X2Rldl9zZW5kX2hkcl9jbWRzX2xvY2tlZChzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYsCj4gPiA+
ICsJCQkJIHN0cnVjdCBpM2NfaGRyX2NtZCAqY21kcywKPiA+ID4gKwkJCQkgaW50IG5jbWRzKQo+
ID4gPiArewo+ID4gPiArCXN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlcjsKPiA+
ID4gKwlpbnQgaTsKPiA+ID4gKwo+ID4gPiArCWlmICghZGV2KQo+ID4gPiArCQlyZXR1cm4gLUVO
T0VOVDsKPiA+ID4gKwo+ID4gPiArCW1hc3RlciA9IGkzY19kZXZfZ2V0X21hc3RlcihkZXYpOwo+
ID4gPiArCWlmICghbWFzdGVyIHx8ICFjbWRzKQo+ID4gPiArCQlyZXR1cm4gLUVJTlZBTDsKPiA+
ID4gKwo+ID4gPiArCWlmIChtYXN0ZXItPm9wX21vZGUgPT0gSTNDX1NMQVZFX01PREUpIHsKPiA+
ID4gKwkJaWYgKGkzY19tYXN0ZXJfcmVxdWVzdF9tYXN0ZXJzaGlwKG1hc3RlcikpCj4gPiA+ICsJ
CQlyZXR1cm4gLUVJTzsKPiA+ID4gKwl9ICAKPiA+IAo+ID4gVGhpcyBwYXRjaCBzZWVtcyB0byBi
ZSBhcHBsaWVkIG9uIHRvcCBvZiBzZWNvbmRhcnkgbWFzdGVyIHBhdGNoIHByb3Bvc2FsLgo+ID4g
Cj4gPiBJIHRoaW5rIGl0IGlzIGJldHRlciB0byByZW1vdmUgdGhlIHNlY29uZGFyeSBtYXN0ZXIg
c3R1ZmZzIGZyb20gaGVyZS4KPiA+IAoKWWVzLCBJJ2xsIGRvIHRoYXQuCgo+ID4gPiArCj4gPiA+
ICsJaWYgKCFtYXN0ZXItPm9wcy0+c2VuZF9oZHJfY21kcykKPiA+ID4gKwkJcmV0dXJuIC1FTk9U
U1VQUDsKPiA+ID4gKwo+ID4gPiArCWZvciAoaSA9IDA7IGkgPCBuY21kczsgaSsrKSB7Cj4gPiA+
ICsJCWlmICghKG1hc3Rlci0+dGhpcy0+aW5mby5oZHJfY2FwICYgQklUKGNtZHMtPm1vZGUpKSkK
PiA+ID4gKwkJCXJldHVybiAtRU5PVFNVUFA7Cj4gPiA+ICsJfQo+ID4gPiArCj4gPiA+ICsJcmV0
dXJuIG1hc3Rlci0+b3BzLT5zZW5kX2hkcl9jbWRzKGRldiwgY21kcywgbmNtZHMpOwo+ID4gPiAr
fQo+ID4gPiArCj4gPiA+ICsKPiA+ID4gIGludCBpM2NfZGV2X2Rpc2FibGVfaWJpX2xvY2tlZChz
dHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYpCj4gPiA+ICB7Cj4gPiA+ICAJc3RydWN0IGkzY19tYXN0
ZXJfY29udHJvbGxlciAqbWFzdGVyOwo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9p
M2MvZGV2aWNlLmggYi9pbmNsdWRlL2xpbnV4L2kzYy9kZXZpY2UuaAo+ID4gPiBpbmRleCA1ZWNi
MDU1Li43NWE5NDdmIDEwMDY0NAo+ID4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2kzYy9kZXZpY2Uu
aAo+ID4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2kzYy9kZXZpY2UuaAo+ID4gPiBAQCAtNDksNiAr
NDksMzEgQEAgZW51bSBpM2NfaGRyX21vZGUgewo+ID4gPiAgCUkzQ19IRFJfVFNMLAo+ID4gPiAg
fTsKPiA+ID4gIAo+ID4gPiArI2RlZmluZSBJM0NfSERSX0dFTl9XUklURV9DTUQoaWQpICAgIAko
aWQpCj4gPiA+ICsjZGVmaW5lIEkzQ19IRFJfVkVORE9SX1dSSVRFX0NNRChpZCkgCSgweDIwICsg
KGlkKSkKPiA+ID4gKyNkZWZpbmUgSTNDX0hEUl9JU19SRUFEX0NNRCAgICAgICAgCUJJVCg3KQo+
ID4gPiArI2RlZmluZSBJM0NfSERSX0dFTl9SRUFEX0NNRChpZCkgICAgCSgweDgwICsgKGlkKSkK
PiA+ID4gKyNkZWZpbmUgSTNDX0hEUl9WRU5ET1JfUkVBRF9DTUQoaWQpICAgIAkoMHhhMCArIChp
ZCkpCj4gPiA+ICsKPiA+ID4gKy8qKgo+ID4gPiArICogc3RydWN0IGkzY19oZHJfY21kIC0gSTND
IEhEUiBjb21tYW5kCj4gPiA+ICsgKiBAbW9kZTogSERSIG1vZGUgc2VsZWN0ZWQgZm9yIHRoaXMg
Y29tbWFuZAo+ID4gPiArICogQGNvZGU6IGNvbW1hbmQgb3Bjb2RlLiBCaXQgNyBlbmNvZGVzIHRo
ZSBkaXJlY3Rpb24gb2YgdGhlIGRhdGEgdHJhbnNmZXIsIGlmCj4gPiA+ICsgKiAgICAgIHNldCB0
aGlzIGlzIGEgcmVhZCwgb3RoZXJ3aXNlIHRoaXMgaXMgYSB3cml0ZQo+ID4gPiArICogQG5kYXRh
d29yZHM6IG51bWJlciBvZiBkYXRhIHdvcmRzIChhIHdvcmQgaXMgMTZiaXRzIHdpZGUpIHRvIHRy
YW5zZmVyCj4gPiA+ICsgKiBAZGF0YTogaW5wdXQvb3V0cHV0IGJ1ZmZlcgo+ID4gPiArICovCj4g
PiA+ICtzdHJ1Y3QgaTNjX2hkcl9jbWQgewo+ID4gPiArICAgIGVudW0gaTNjX2hkcl9tb2RlIG1v
ZGU7Cj4gPiA+ICsgICAgdTggY29kZTsKPiA+ID4gKyAgICBpbnQgbmRhdGF3b3JkczsKPiA+ID4g
KyAgICB1bmlvbiB7Cj4gPiA+ICsgICAgICAgIHUxNiAqaW47Cj4gPiA+ICsgICAgICAgIGNvbnN0
IHUxNiAqb3V0Owo+ID4gPiArICAgIH0gZGF0YTsKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gKwo+
ID4gPiAgLyoqCj4gPiA+ICAgKiBzdHJ1Y3QgaTNjX3ByaXZfeGZlciAtIEkzQyBTRFIgcHJpdmF0
ZSB0cmFuc2Zlcgo+ID4gPiAgICogQHJudzogZW5jb2RlcyB0aGUgdHJhbnNmZXIgZGlyZWN0aW9u
LiB0cnVlIGZvciBhIHJlYWQsIGZhbHNlIGZvciBhIHdyaXRlCj4gPiA+IEBAIC0yODksNiArMzE0
LDEwIEBAIGludCBpM2NfZGV2aWNlX2RvX3ByaXZfeGZlcnMoc3RydWN0IGkzY19kZXZpY2UgKmRl
diwKPiA+ID4gIAkJCSAgICAgc3RydWN0IGkzY19wcml2X3hmZXIgKnhmZXJzLAo+ID4gPiAgCQkJ
ICAgICBpbnQgbnhmZXJzKTsKPiA+ID4gIAo+ID4gPiAraW50IGkzY19kZXZpY2Vfc2VuZF9oZHJf
Y21kcyhzdHJ1Y3QgaTNjX2RldmljZSAqZGV2LAo+ID4gPiArCQkJICAgICBzdHJ1Y3QgaTNjX2hk
cl9jbWQgKmNtZHMsCj4gPiA+ICsJCQkgICAgIGludCBuY21kcyk7Cj4gPiA+ICsKPiA+ID4gIHZv
aWQgaTNjX2RldmljZV9nZXRfaW5mbyhzdHJ1Y3QgaTNjX2RldmljZSAqZGV2LCBzdHJ1Y3QgaTNj
X2RldmljZV9pbmZvICppbmZvKTsKPiA+ID4gIAo+ID4gPiAgc3RydWN0IGkzY19pYmlfcGF5bG9h
ZCB7Cj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2kzYy9tYXN0ZXIuaCBiL2luY2x1
ZGUvbGludXgvaTNjL21hc3Rlci5oCj4gPiA+IGluZGV4IGFkYTk1NmEuLmZkNTA0NzMgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvaTNjL21hc3Rlci5oCj4gPiA+ICsrKyBiL2luY2x1
ZGUvbGludXgvaTNjL21hc3Rlci5oCj4gPiA+IEBAIC0zODYsNiArMzg2LDEwIEBAIHN0cnVjdCBp
M2NfYnVzIHsKPiA+ID4gICAqCQkgIFRoaXMgbWV0aG9kIGlzIG1hbmRhdG9yeS4KPiA+ID4gICAq
IEBwcml2X3hmZXJzOiBkbyBvbmUgb3Igc2V2ZXJhbCBwcml2YXRlIEkzQyBTRFIgdHJhbnNmZXJz
Cj4gPiA+ICAgKgkJVGhpcyBtZXRob2QgaXMgbWFuZGF0b3J5Lgo+ID4gPiArICogQHNlbmRfaGRy
X2NtZHM6IHNlbmQgb25lIG9yIHNldmVyYWwgSERSIGNvbW1hbmRzLiBJZiB0aGVyZSBpcyBtb3Jl
IHRoYW4gb25lCj4gPiA+ICsgKgkJICAgY29tbWFuZCwgdGhleSBzaG91bGQgaWRlYWxseSBiZSBz
ZW50IGluIHRoZSBzYW1lIEhEUgo+ID4gPiArICoJCSAgIHRyYW5zYWN0aW9uLgo+ID4gPiArICoJ
CSAgIFRoaXMgbWV0aG9kIGlzIG9wdGlvbmFsLgo+ID4gPiAgICogQGF0dGFjaF9pMmNfZGV2OiBj
YWxsZWQgZXZlcnkgdGltZSBhbiBJMkMgZGV2aWNlIGlzIGF0dGFjaGVkIHRvIHRoZSBidXMuCj4g
PiA+ICAgKgkJICAgIFRoaXMgaXMgYSBnb29kIHBsYWNlIHRvIGF0dGFjaCBtYXN0ZXIgY29udHJv
bGxlciBzcGVjaWZpYwo+ID4gPiAgICoJCSAgICBkYXRhIHRvIEkyQyBkZXZpY2VzLgo+ID4gPiBA
QCAtNDU3LDYgKzQ2MSw5IEBAIHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXJfb3BzIHsKPiA+
ID4gIAlpbnQgKCpwcml2X3hmZXJzKShzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYsCj4gPiA+ICAJ
CQkgIHN0cnVjdCBpM2NfcHJpdl94ZmVyICp4ZmVycywKPiA+ID4gIAkJCSAgaW50IG54ZmVycyk7
Cj4gPiA+ICsJaW50ICgqc2VuZF9oZHJfY21kcykoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2LAo+
ID4gPiArCQkJICAgICBjb25zdCBzdHJ1Y3QgaTNjX2hkcl9jbWQgKmNtZHMsCj4gPiA+ICsJCQkg
ICAgIGludCBuY21kcyk7Cj4gPiA+ICAJaW50ICgqYXR0YWNoX2kyY19kZXYpKHN0cnVjdCBpMmNf
ZGV2X2Rlc2MgKmRldik7Cj4gPiA+ICAJdm9pZCAoKmRldGFjaF9pMmNfZGV2KShzdHJ1Y3QgaTJj
X2Rldl9kZXNjICpkZXYpOwo+ID4gPiAgCWludCAoKmkyY194ZmVycykoc3RydWN0IGkyY19kZXZf
ZGVzYyAqZGV2LCAgCj4gPiAKPiA+IFdpdGggdGhpcyBhcHByb2FjaCB0aGUgY29udHJvbGxlciBi
ZXR3ZWVuIGEgc3RhcnQgYW5kIHN0b3AgY2FuIG9ubHkgdHJhbnNtaXQgaW4gU0RSIG9yIEhEUi4K
PiA+IAo+ID4gVGhpcyBpcyBsaW1pdGVkIGZvciBkZXZpY2VzIHRoYXQgbmVlZCB0aGUgZm9sbG93
aW5nIGZyYW1lOgo+ID4gwqDCoMKgIDxTdGFydD48U0RSIHhmZXI+PFJlcGVhdGVkIFN0YXJ0PjxI
RFIgY29tbWFuZD48U3RvcD4KCkFjdHVhbGx5LCB0aGVyZSBpcyByZXBlYXRlZCBzdGFydCBiZXR3
ZWVuIFNEUiBhbmQgRU5USERSLiBUaGVyZSBpcyBubyByZXBlYXRlZApzdGFydCBiZXR3ZWVuIEVO
VEhEUiBhbmQgSERSIGNvbW1hbmRzLCBIRFIgY29tbWFuZCBoYXMgdG8gc3RhcnQgaW1tZWRldGx5
IGFmdGVyCkVOVEhEUi4gT2YgY291cnNlLCBoZHIgcmVzdGFydCBtYXkgb2NjdXIgYmV0d2VlbiBI
RFIgY29tbWFuZHMuCgo+IAo+IElmIHRoaXMgaXMgYSB1c2UgY2FzZSB3ZSB3YW50IHRvIHN1cHBv
cnQsIHRoZW4gd2Ugc2hvdWxkIHByb2JhYmx5IGhhdmUKPiBzb21ldGhpbmcgbW9yZSBnZW5lcmlj
IHRoYW4gd2hhdCB3ZSBjdXJyZW50bHkgaGF2ZS4KPiAKPiBTb21ldGhpbmcgbGlrZQo+IAo+IGVu
dW0gaTNjX3hmZXJfdHlwZSB7Cj4gCUkzQ19DQ0NfWEZFUiwKPiAJSTNDX1NEUl9YRkVSLAo+IAlJ
M0NfSERSX1hGRVIsCj4gfQo+IAo+IHN0cnVjdCBpM2NfeGZlciB7Cj4gCWVudW0gaTNjX3hmZXJf
dHlwZSB0eXBlOwo+IAl1bmlvbiB7Cj4gCQlzdHJ1Y3QgaTNjX2NjY19jbWQgY2NjOwo+IAkJc3Ry
dWN0IGkzY19wcml2X3hmZXIgc2RyOwo+IAkJc3RydWN0IGkzY19oZHJfY21kIGhkcjsKPiAJfTsK
PiB9Cj4gCj4gc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlcl9vcHMgewo+IAkuLi4KPiAJaW50
ICgqaTNjX3hmZXJzKShzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYsCj4gCQkJIHN0cnVjdCBpM2Nf
eGZlciAqeGZlcnMsCj4gCQkJIGludCBueGZlcnMpOwo+IAkuLi4KPiB9OwoKSSBhZ3JlZS4gVGhp
cyBpcyBzb21ldGhpbmcgd2Ugc2hvdWxkIHRoaW5rIG9mLgoKLS0gCi0tIApQcnplbXlzbGF3IEdh
agoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
