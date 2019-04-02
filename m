Return-Path: <SRS0=X30F=SE=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE0EC4360F
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Apr 2019 11:23:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D66DE20883
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Apr 2019 11:23:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h4/wnzNT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="MzJ7JU7j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="UEjQhSu1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D66DE20883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OaTyyGqo9eiqHjI4f7qFjjLhc+oei3C1MkuU7TUM2aA=; b=h4/wnzNTXBVUyR
	FsB5DFDyF8mQKXLgtBc75rVy1prlxNsee27p8epDsV1Y6Po7HVhOyDetQGGxdaBn7EEa62Ro85IxH
	ClAnU3mCehxvVArKa3dcBZ7t4o5urAwEwrIr5vnXEPWatdSfISszFU5klq4IH9nr/Yf/fDrjm+IBX
	VEloUIpl7Ue33Fh5WbzR6Mn0wvHQO3gngLZlnYFGgYQXbgNjQLWI80PriGwhuGnaO4ms0ueKJKr0d
	9oPtuIV0zdzH0gEl3PYM6qqVltQUdzlz2wZB/WHGw0l6XMsQhCGIBYCiTo3+z2WcDdKndHsZZW7pF
	hprEsB+G+63udoORc8NQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBHVR-0004it-BP; Tue, 02 Apr 2019 11:23:05 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBHVO-0004i8-LQ
 for linux-i3c@lists.infradead.org; Tue, 02 Apr 2019 11:23:04 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x32BIiqF012016; Tue, 2 Apr 2019 04:22:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=Bx92WtqDtMDZ2VY41wRCvcW55M8UyjKRc0GtG4IsAlc=;
 b=MzJ7JU7jz4s74R2AwxERIGtnun+HRVjix0ESNg75FLuHsLfg0NlLMeEQXIjk6ryEA1VO
 8bng/CCo9k0D0BlfnxpBzw/8+io5vfFlI9vSfO4tSINbq5LE9R040qy8uGCQTdY7zmlL
 i+WAGrIkIWXyevGlLx5buTnijifPboOA3zCKo9p2bZwqhB4fBpVBTDWsW8vKSy2Q3FhO
 9W7b41HeKR8yhOGIYpkyBKVSDoDgs51mKhigvCvaGodFtfF1c4iKGYx9iizWBn877aAF
 DT7+2LhbTt1RXruAES/IQzD5C/bxbWXam1sP/bAPlj3b4i+7H0da4ZnSQH2FlWk6FHnY cQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2052.outbound.protection.outlook.com [104.47.36.52])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2rkurqtsk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 02 Apr 2019 04:22:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bx92WtqDtMDZ2VY41wRCvcW55M8UyjKRc0GtG4IsAlc=;
 b=UEjQhSu1HyqXZ+PTv1uem3pecn0pwJ5AgHwbk0pM8ucaL7zQ5IwNHd2piHRZPlY3zznaudf+Xub8rZomGs2v532kL8+0xG3kr6xlw6FNW2OKPpbASB1OHTtQ0MjZybImv7TbVVnZBhF9y4Iz9quCRdYinNoanbISQpE0Upl4qWQ=
Received: from SN4PR0701CA0024.namprd07.prod.outlook.com
 (2603:10b6:803:28::34) by CY1PR07MB2297.namprd07.prod.outlook.com
 (2a01:111:e400:c5b3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1750.16; Tue, 2 Apr
 2019 11:22:55 +0000
Received: from DM3NAM05FT061.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::202) by SN4PR0701CA0024.outlook.office365.com
 (2603:10b6:803:28::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1750.17 via Frontend
 Transport; Tue, 2 Apr 2019 11:22:55 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM3NAM05FT061.mail.protection.outlook.com (10.152.98.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1771.6 via Frontend Transport; Tue, 2 Apr 2019 11:22:54 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x32BMoHF012469
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 2 Apr 2019 07:22:52 -0400
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 2 Apr 2019 04:22:49 -0700
Date: Tue, 2 Apr 2019 12:22:46 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: vitor <vitor.soares@synopsys.com>
Subject: Re: [PATCH v4 1/6] i3c: add addr and lvr to i2c_dev_desc structure
Message-ID: <20190402112244.GA23976@global.cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-2-pgaj@cadence.com>
 <20190330153618.48719ee5@collabora.com>
 <87ba262f-384e-711c-4673-103099cdb8ad@synopsys.com>
 <20190401203148.028cdf01@collabora.com>
 <2257791c-6bef-3015-664b-470ebf55b726@synopsys.com>
 <20190401212447.4e992f60@collabora.com>
 <f1d1a287-139f-1b0e-e4ad-b375cf693186@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1d1a287-139f-1b0e-e4ad-b375cf693186@synopsys.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(376002)(136003)(2980300002)(36092001)(189003)(199004)(4326008)(6246003)(446003)(16526019)(33656002)(16586007)(53936002)(186003)(3846002)(50466002)(106466001)(68736007)(2486003)(6116002)(6916009)(5660300002)(1076003)(23676004)(476003)(53416004)(26826003)(229853002)(66066001)(55016002)(81156014)(81166006)(8936002)(336012)(97736004)(93886005)(8676002)(53546011)(5024004)(47776003)(7736002)(316002)(305945005)(386003)(54906003)(7696005)(58126008)(107886003)(6286002)(26005)(478600001)(486006)(426003)(69596002)(956004)(6666004)(2906002)(126002)(105596002)(11346002)(76176011)(86362001)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR07MB2297; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e863b20-5c30-4dda-3b65-08d6b75d8d51
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY1PR07MB2297; 
X-MS-TrafficTypeDiagnostic: CY1PR07MB2297:
X-Microsoft-Antispam-PRVS: <CY1PR07MB2297C94B3C6A9997DB742F54C2560@CY1PR07MB2297.namprd07.prod.outlook.com>
X-Forefront-PRVS: 0995196AA2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xqfsRVj+hXU8ablv9EcoFnO5KV257NaiY/d0pbuF/VIQRrqkYd+195Ix80lPcoVETi5BdaWFW6/fpMbWuCelEMFusBtR21ih98u+eQtBJY40GxRyCAHGNmG8DKYKxjSbNS2YlH8hX0RXZp36qY2Jvzw8YQigG3B3PIPuWpFNL1rU+2pno96DzQGHYBgOj9+PBg5goyPvSXlitB0eUvcfiVNJbmnugUSkunuqviQ6RAhlPZTth4J8qcYjkIqHE9X8IMrwGlSD5Y+coSAuKOYa78K6lG8L8q0GRjSFsDqKZfE6tfP1owlihVW8Kznna9VnMyZGwKRb1qsGLWSvXsxEUTV0/8JC/5pwf/FS9g5xQ0vCVkmcawiUYAkqIJ/jCRpD8iDooh7JGbUUBwJLDyYwGnu0TxgYZyOQKa6vW1zkaqQ=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2019 11:22:54.7524 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e863b20-5c30-4dda-3b65-08d6b75d8d51
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2297
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904020079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_042302_892453_0C4A340B 
X-CRM114-Status: GOOD (  23.10  )
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

Hi,

The 04/02/2019 12:10, vitor wrote:
> 
> Hi,
> 
> 
> On 01/04/19 20:24, Boris Brezillon wrote:
> > On Mon, 1 Apr 2019 19:48:45 +0100
> > vitor <vitor.soares@synopsys.com> wrote:
> >
> >> Hi,
> >>
> >> On 01/04/19 19:31, Boris Brezillon wrote:
> >>> On Mon, 1 Apr 2019 19:17:03 +0100
> >>> vitor <vitor.soares@synopsys.com> wrote:
> >>>  
> >>>> Hi,
> >>>>
> >>>> On 30/03/19 14:36, Boris Brezillon wrote:  
> >>>>> On Sun, 10 Mar 2019 13:58:38 +0000
> >>>>> Przemyslaw Gaj <pgaj@cadence.com> wrote:
> >>>>>    
> >>>>>> I need to store address and lvr value for I2C devices without static definition
> >>>>>> in DT. This allows secondary master to transmit DEFSLVS command properly.
> >>>>>>
> >>>>>> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> >>>>>> ---
> >>>>>>  include/linux/i3c/master.h | 5 +++++
> >>>>>>  1 file changed, 5 insertions(+)
> >>>>>>
> >>>>>> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> >>>>>> index eca8337..3c27d9f 100644
> >>>>>> --- a/include/linux/i3c/master.h
> >>>>>> +++ b/include/linux/i3c/master.h
> >>>>>> @@ -71,6 +71,9 @@ struct i2c_dev_boardinfo {
> >>>>>>   * @common: common part of the I2C device descriptor
> >>>>>>   * @boardinfo: pointer to the boardinfo attached to this I2C device
> >>>>>>   * @dev: I2C device object registered to the I2C framework
> >>>>>> + * @addr: I2C device address
> >>>>>> + * @lvr: LVR (Legacy Virtual Register) needed by the I3C core to know about
> >>>>>> + *	 the I2C device limitations
> >>>>>>   *
> >>>>>>   * Each I2C device connected on the bus will have an i2c_dev_desc.
> >>>>>>   * This object is created by the core and later attached to the controller
> >>>>>> @@ -84,6 +87,8 @@ struct i2c_dev_desc {
> >>>>>>  	struct i3c_i2c_dev_desc common;
> >>>>>>  	const struct i2c_dev_boardinfo *boardinfo;
> >>>>>>  	struct i2c_client *dev;
> >>>>>> +	u16 addr;
> >>>>>> +	u8 lvr;    
> >>>>> You also need to remove lvr from i2c_dev_boardinfo and adjust the code
> >>>>> to use i2c_dev_desc->addr and i2c_dev_desc->lvr in this patch, not in
> >>>>> patch 3.
> >>>>>    
> >>>> Why can't we keep the lvr and addr in i2c_dev_boardinfo and need this information on i2c_dev_desc?  
> >>> Because i2c_dev_boardinfo is extracted from the DT and the secondary
> >>> slaves does not necessarily have this description. The idea is to keep
> >>> reserving the address slot for the I2C device even if we don't expose
> >>> it to the upper layers.  
> >> So you are using i2c_dev_boardinfo just for DT devices?
> > All devices that are described in some way, can be through DT, ACPI or
> > board-file desc (only DT is supported right now, but we can easily add
> > support for other formats).
> 
> We can drop i2c_dev_boardinfo.
>

Why you think we can drop it? We are still using it for DT devices.

> >
> >> Because at end we need to register the new i2c devs.
> > No, only those that have a valid description, because there's nothing
> > you can expose if you only have the address and LVR values. You at
> > least need to know which driver this dev should be attached to
> > (compatible string in your DT) and most drivers also need extra
> > information (basically all the DT props that are described a the DT
> > binding).
> 
> In any case the HC need to know the bus mode, how is this done?

LVR is passed through DEFSLVS command.

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
