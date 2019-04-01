Return-Path: <SRS0=6/zw=SD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0645C10F05
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Apr 2019 19:11:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C4032146E
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Apr 2019 19:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VIvwhwUi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="SkEUMOu4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="SxVeiwfT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C4032146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLfBt/jlcP+AyOG9cI+uf4uNjgriBjAFQ2dAUGxMAn8=; b=VIvwhwUiXrbxEQ
	lbQdaPifS7AnTno0eVEeHpXmZfI1h/HkH8i0q1mB83l42swOdv12T8OBIAOn8HRkr6jJ0PFbdDri2
	yiYEeU40XQPpOFaKQJDQQtEOlh+JAz5ZD8yXeGtKni6u8NmUUJAlxorSEOrS3a/UF+q2pBCaGq5O7
	T3kgez6vwuMgwVl/Zg7u8R1YiqX+lqZ7xI59CwclK953VvOwVvSWZMgulGupbMGplCaJ99ylVWUfb
	SOKvwQLpoNqVZzlq0yELtDMjJfKtSBHUR8ymE1d5YPD5HPgueQ9caAByvNQbD4yaiDdid/Ed9BhzH
	7etNKbXe7oyOzL4NMSZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB2Kp-0001rb-9v; Mon, 01 Apr 2019 19:11:07 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB2Kl-0001qw-6u
 for linux-i3c@lists.infradead.org; Mon, 01 Apr 2019 19:11:05 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x31J95H5019565; Mon, 1 Apr 2019 12:10:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=EpeyM1uthWyWBbE2SmcGix6wacN6ensQbEP/p1UBZEI=;
 b=SkEUMOu4O51TMihv1mQxy2TWBiwhDmQOiz6N5TTJTqJbF4vDrMSArDyHQiAldekfHoak
 J781Uf2WtYyMsyLiiEWB2+VeduNjVGkewdPpqSa4a3iDm1cqpMYFsaWoKTll2g0UnQFA
 mOGA9I8pzKIZgvKWKBgJXJZkerrzhjAQWRKJPhdIlRmdOCbNTaDgCThMCmH/PfxglFnb
 Oh+a9IEUFMrW8MdOnhsazJWm778zGmMqHaEtKednNkb8RE75SR5FBhoh8Htvxh74iTWI
 lWpwOjNeMDuGcS7+c3KypV3VDWD49O6Jjn5evm/OHuPVJ5CynRnOH4BG8RoC17l3LKq1 tQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-by2-obe.outbound.protection.outlook.com
 (mail-by2nam05lp2053.outbound.protection.outlook.com [104.47.50.53])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2rj41w45ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Apr 2019 12:10:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpeyM1uthWyWBbE2SmcGix6wacN6ensQbEP/p1UBZEI=;
 b=SxVeiwfT5u/NNfUF4XGNIbIyignjNADxHMzc6qD6nCwa24nQfUvqkjPAaz2RKVZLc7ifcgpfvkjvzQR7qxY7o10s50y2uxu7aEn6Qjg3O8ldm0N+7U2tO4XEDMIPraZWlNlDSYwH0bppcmwxADRlFA1IuI40L0zJnECQbqQcI4s=
Received: from DM5PR07CA0082.namprd07.prod.outlook.com (2603:10b6:4:ad::47) by
 BN7PR07MB4706.namprd07.prod.outlook.com (2603:10b6:406:f1::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.20; Mon, 1 Apr 2019 19:10:52 +0000
Received: from BY2NAM05FT015.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::203) by DM5PR07CA0082.outlook.office365.com
 (2603:10b6:4:ad::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1750.17 via Frontend
 Transport; Mon, 1 Apr 2019 19:10:52 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 BY2NAM05FT015.mail.protection.outlook.com (10.152.100.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.6 via Frontend Transport; Mon, 1 Apr 2019 19:10:51 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x31JAkZD002430
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 1 Apr 2019 15:10:48 -0400
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 1 Apr 2019 12:10:43 -0700
Date: Mon, 1 Apr 2019 20:10:40 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: vitor <vitor.soares@synopsys.com>
Subject: Re: [PATCH v4 1/6] i3c: add addr and lvr to i2c_dev_desc structure
Message-ID: <20190401191038.GA25866@global.cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-2-pgaj@cadence.com>
 <20190330153618.48719ee5@collabora.com>
 <87ba262f-384e-711c-4673-103099cdb8ad@synopsys.com>
 <20190401203148.028cdf01@collabora.com>
 <2257791c-6bef-3015-664b-470ebf55b726@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2257791c-6bef-3015-664b-470ebf55b726@synopsys.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(36092001)(199004)(189003)(486006)(26005)(97736004)(7736002)(53416004)(305945005)(186003)(5024004)(53546011)(16526019)(386003)(316002)(81166006)(2486003)(7696005)(2906002)(8676002)(16586007)(58126008)(5660300002)(69596002)(68736007)(54906003)(8936002)(1076003)(55016002)(50466002)(76176011)(86362001)(93886005)(4326008)(81156014)(6246003)(106466001)(105596002)(66066001)(478600001)(336012)(33656002)(53936002)(107886003)(229853002)(23676004)(6286002)(446003)(6116002)(476003)(126002)(426003)(11346002)(956004)(3846002)(356004)(6916009)(26826003)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR07MB4706; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99e727d6-7245-4a20-3044-08d6b6d5c21d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN7PR07MB4706; 
X-MS-TrafficTypeDiagnostic: BN7PR07MB4706:
X-Microsoft-Antispam-PRVS: <BN7PR07MB47067D31EB806BB2DC893675C2550@BN7PR07MB4706.namprd07.prod.outlook.com>
X-Forefront-PRVS: 0994F5E0C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: veuAYBzY7gtcRKFg/wHwEPj9OPJRNEZk6Lbucs+uncW07bHImw1/EKIRgrGtLEn9UzKb5rKgWmOlbh0R6DB3Xq2vd6sWW3WZ3p+CgMtYq7jmS00C0o9ZdDLMBi+4NWhUHbYdNme/4D2OWgiezPyr9liTxE3uHFLLbF94dBFHC6+GMCpe3k8E6ZwwyOvut6VuTL1PBsDnDIwORRDZWMcdF7PSr7iK9l7AXm1cIZsqFdPi7sCVC1TSIW3w71Wyu46HjlJwwQhn2UTQfwvdzJAoGe0LMfKtQbnN4OazqNO8HjBC6eGHGg6zVRF/K6Uui4TKKISIlPL3AbNnkZxRk1HONgQt04g4MgvWSl6UXvz6cN0lo2XMg+gID6cS7YJBLXD60RmyPDRlDTwORA8kxT5yJgMotUqwliriB+vqvsHPog0=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2019 19:10:51.7974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e727d6-7245-4a20-3044-08d6b6d5c21d
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4706
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-01_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904010123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_121104_232797_F3B13844 
X-CRM114-Status: GOOD (  19.74  )
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
Cc: linux-i3c@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>, rafalc@cadence.com,
 agolec@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

The 04/01/2019 19:48, vitor wrote:
> 
> Hi,
> 
> On 01/04/19 19:31, Boris Brezillon wrote:
> > On Mon, 1 Apr 2019 19:17:03 +0100
> > vitor <vitor.soares@synopsys.com> wrote:
> >
> >> Hi,
> >>
> >> On 30/03/19 14:36, Boris Brezillon wrote:
> >>> On Sun, 10 Mar 2019 13:58:38 +0000
> >>> Przemyslaw Gaj <pgaj@cadence.com> wrote:
> >>>  
> >>>> I need to store address and lvr value for I2C devices without static definition
> >>>> in DT. This allows secondary master to transmit DEFSLVS command properly.
> >>>>
> >>>> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> >>>> ---
> >>>>  include/linux/i3c/master.h | 5 +++++
> >>>>  1 file changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> >>>> index eca8337..3c27d9f 100644
> >>>> --- a/include/linux/i3c/master.h
> >>>> +++ b/include/linux/i3c/master.h
> >>>> @@ -71,6 +71,9 @@ struct i2c_dev_boardinfo {
> >>>>   * @common: common part of the I2C device descriptor
> >>>>   * @boardinfo: pointer to the boardinfo attached to this I2C device
> >>>>   * @dev: I2C device object registered to the I2C framework
> >>>> + * @addr: I2C device address
> >>>> + * @lvr: LVR (Legacy Virtual Register) needed by the I3C core to know about
> >>>> + *	 the I2C device limitations
> >>>>   *
> >>>>   * Each I2C device connected on the bus will have an i2c_dev_desc.
> >>>>   * This object is created by the core and later attached to the controller
> >>>> @@ -84,6 +87,8 @@ struct i2c_dev_desc {
> >>>>  	struct i3c_i2c_dev_desc common;
> >>>>  	const struct i2c_dev_boardinfo *boardinfo;
> >>>>  	struct i2c_client *dev;
> >>>> +	u16 addr;
> >>>> +	u8 lvr;  
> >>> You also need to remove lvr from i2c_dev_boardinfo and adjust the code
> >>> to use i2c_dev_desc->addr and i2c_dev_desc->lvr in this patch, not in
> >>> patch 3.
> >>>  
> >> Why can't we keep the lvr and addr in i2c_dev_boardinfo and need this information on i2c_dev_desc?
> > Because i2c_dev_boardinfo is extracted from the DT and the secondary
> > slaves does not necessarily have this description. The idea is to keep
> > reserving the address slot for the I2C device even if we don't expose
> > it to the upper layers.
> 
> So you are using i2c_dev_boardinfo just for DT devices? Because at end we need to register the new i2c devs.

Yes, exactly. On secondary master side we are registering only I2C devices with
DT definition.

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
