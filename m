Return-Path: <SRS0=MhNy=SM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18968C10F11
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Apr 2019 06:54:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2ED12083E
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Apr 2019 06:54:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tuGB3wS7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="n3DbRz4w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="LgMcSpXI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2ED12083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2mnnMoEC5a1vQlkBK/AcVdxb9ZwKqVSSaFWMsqZBak=; b=tuGB3wS79Q8Bfj
	pJ5EfHLxPDe3zUpAtTPA6I4HE61U9jt4GiM2MFE2QpdNUppXq4gG6rc/Z770mQ2fglBW/ry5qdg6T
	WjPXeNpgonCF2LVlfuySwIDdzZusiJMnmjbauu3z2vJu2u2RkuugbdWC8WSBTv6qqcnjX0QQ4ERCI
	ZloqJwm5ymOtga73rf60RX3eY1EpLN9PwvLhryN0AzNcQVvvUXF9BsS1TGt+5bRrlL9G70KOfkHgN
	5K2ii47FknaiKCfWZMmbhizWDiBgZTKLy2zrLG5W+Dqtozxppr6hazU8cPiTGymrV2Urpb4vx14mq
	zBqv/vBabjjTHr9RFcbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE77Q-0000rk-DG; Wed, 10 Apr 2019 06:54:00 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE77M-0000qv-0T
 for linux-i3c@lists.infradead.org; Wed, 10 Apr 2019 06:53:58 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3A6n4Pw017902; Tue, 9 Apr 2019 23:53:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=u4ozpMtjN9e++BNLTbD41kLVdJ2Od4zSbjW/qeUXkh0=;
 b=n3DbRz4wu1/DSSOHbVkwdlptzTx+C8U0gRFRutUzZijukREJJC/SD3dkxuKVZ7RRsr2n
 wm84wXlBP7PpTQz/oHl1B97/UeWrT47AoFXSfpXds4pJzWeKfMy3c6ci7GPQu+7Yx+y1
 xWiYBwph19ubndvy7NlgfrKcTk0Cr8k04HBgV0q80e4UwJCXQljCBtQC4Wc9TKujqNe3
 OWenE9Pn3HmFjN3PMP/eOrL4ABvOGuWDbbkEbxp9mkRyxNag5c1Pzz2cdaHKKUbws15v
 N5mtylbNYwm3eng86Rv1w3UIzc2P0iBpHbBzBnavflxFCv5xyTr5PX0m1SS6OQoPUVOW kA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-co1-obe.outbound.protection.outlook.com
 (mail-co1nam05lp2053.outbound.protection.outlook.com [104.47.48.53])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2rsa27rcjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Apr 2019 23:53:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ozpMtjN9e++BNLTbD41kLVdJ2Od4zSbjW/qeUXkh0=;
 b=LgMcSpXIf6riVhwgq4Iy7QmUzrTiK1NiTUtlGF5G/iLf6rwoD3w1e6Vdji54SJtDXHoAb7RZj0VRnGdQLHhd3zBrtRl/Zw8smB/rCMed1NyCuzswMv8j5ZdNaL3fwtccj7MoFQ20SBnKlph7FfaqHg4qr1L2i0VN4HXNbfmgIk4=
Received: from BYAPR07CA0102.namprd07.prod.outlook.com (2603:10b6:a03:12b::43)
 by SN1PR07MB2301.namprd07.prod.outlook.com (2a01:111:e400:7a45::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1771.21; Wed, 10 Apr
 2019 06:53:47 +0000
Received: from BY2NAM05FT013.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::209) by BYAPR07CA0102.outlook.office365.com
 (2603:10b6:a03:12b::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1792.14 via Frontend
 Transport; Wed, 10 Apr 2019 06:53:46 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BY2NAM05FT013.mail.protection.outlook.com (10.152.100.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.7 via Frontend Transport; Wed, 10 Apr 2019 06:53:46 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x3A6rjNP021494
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 9 Apr 2019 23:53:45 -0700
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 9 Apr 2019 23:53:42 -0700
Date: Wed, 10 Apr 2019 07:53:40 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Vitor Soares <vitor.soares@synopsys.com>
Subject: Re: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190410065339.GB8934@global.cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-4-pgaj@cadence.com>
 <06a6f65b-a397-27c9-fa4f-e2147080be12@synopsys.com>
 <13D59CF9CEBAF94592A12E8AE55501350A61307C@DE02WEMBXB.internal.synopsys.com>
 <20190409152028.GA8934@global.cadence.com>
 <13D59CF9CEBAF94592A12E8AE55501350A6130A6@DE02WEMBXB.internal.synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13D59CF9CEBAF94592A12E8AE55501350A6130A6@DE02WEMBXB.internal.synopsys.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(346002)(376002)(2980300002)(36092001)(189003)(199004)(8936002)(3846002)(50466002)(106466001)(8676002)(246002)(6116002)(76176011)(2906002)(5660300002)(16586007)(53416004)(229853002)(58126008)(23676004)(54906003)(316002)(305945005)(2486003)(7636002)(7736002)(7696005)(105596002)(6916009)(55016002)(33656002)(6286002)(478600001)(76130400001)(476003)(186003)(486006)(446003)(126002)(956004)(11346002)(14444005)(426003)(1076003)(86362001)(26826003)(107886003)(386003)(6246003)(4326008)(66066001)(336012)(47776003)(26005)(356004)(93886005)(16526019);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR07MB2301; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b909683c-da74-41fe-2b1e-08d6bd814787
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:SN1PR07MB2301; 
X-MS-TrafficTypeDiagnostic: SN1PR07MB2301:
X-Microsoft-Antispam-PRVS: <SN1PR07MB230149383A91169D86C57A7AC22E0@SN1PR07MB2301.namprd07.prod.outlook.com>
X-Forefront-PRVS: 00032065B2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: lGgCNc+R/0d+Kmj6Rwqns+MF616rk9u9wVOYc+b2I7A/fGyQBR6FzARbzunXw/ugKfWxgSZ0qNBWj48Q1yNwFuMV1u5A9jLKtvfvRjzx3JY5wc3mICSS+4O7UH1ogqy9o/t1OmM0yz1VuHBTxYuMsQq0OqlslCZF7Z52Py1EGtD4Rod1dMQ5dpUpkOvYxDsivO2ZJfTRxA60RwzniSIGPYpb43xBgHM/Qnu5TIsIIp2eFF14/jkPN4sYIzTrtZ4yKDRlqqkHJpWhhhdlsEkKLkf5jfbKv+Bzv69t1cTf5/kgdaTuYeB2P3H0tQ/Bdc2vgXLQ7KMFYIhP63wnn7yPlNYh6Yb6bpEKLKo0DSu/AKUNI3LUIsMOR58Q9i5zlZED7VxQOM4D7Rapufax8cFETcm2OjA+YWrMXs6ov2oT6QA=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2019 06:53:46.7294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b909683c-da74-41fe-2b1e-08d6bd814787
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR07MB2301
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-10_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904100049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_235357_040361_16F973A6 
X-CRM114-Status: GOOD (  34.25  )
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
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "agolec@cadence.com" <agolec@cadence.com>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

The 04/09/2019 15:46, Vitor Soares wrote:
> 
> Hi Przemek,
> 
> From: Przemyslaw Gaj <pgaj@cadence.com>
> Date: Tue, Apr 09, 2019 at 16:20:30
> 
> > Hi Vitor,
> > 
> > The 04/09/2019 14:31, Vitor Soares wrote:
> > > 
> > > Hi Przemek,
> > > 
> > > From my analyses you do i3c_master_register for secondary master in follow 
> > cases:
> > > - HC has already an dynamic address and it is the owner of the bus.
> > 
> > Correct. It requests bus ownership before registration, if DA is assigned.
> > 
> > > Or 
> > > - when it receive MR event enabled
> > 
> > Actually, when MR event is enabled and secondary master is not initialized 
> > yet.
> 
> I didn't find where you do this verification, can you point me?

In the driver, cdns_i3c_sec_master_event_up(). I'm requesting mastership and
registering the master when event is enabled and master is not registered yet.

> 
> > 
> > > 
> > > Is this correct?
> > > 
> > > From: vitor <soares@synopsys.com>
> > > Date: Mon, Apr 01, 2019 at 19:41:39
> > > 
> > > > Hi Przemek,
> > > > 
> > > > > +/**
> > > > >   * i3c_master_register() - register an I3C master
> > > > >   * @master: master used to send frames on the bus
> > > > >   * @parent: the parent device (the one that provides this I3C master
> > > > >   *	    controller)
> > > > >   * @ops: the master controller operations
> > > > > - * @secondary: true if you are registering a secondary master. Will 
> > return
> > > > > - *	       -ENOTSUPP if set to true since secondary masters are not yet
> > > > > - *	       supported
> > > > > + * @secondary: true if you are registering a secondary master.
> > > > >   *
> > > > >   * This function takes care of everything for you:
> > > > >   *
> > > > > @@ -2427,10 +2672,6 @@ int i3c_master_register(struct 
> > i3c_master_controller 
> > > > *master,
> > > > >  	struct i2c_dev_boardinfo *i2cbi;
> > > > >  	int ret;
> > > > >  
> > > > > -	/* We do not support secondary masters yet. */
> > > > > -	if (secondary)
> > > > > -		return -ENOTSUPP;
> > > > > -
> > > > >  	ret = i3c_master_check_ops(ops);
> > > > >  	if (ret)
> > > > >  		return ret;
> > > 
> > > The bus mode is set before the sec master does 
> > i3c_master_add_i3c_dev_locked() and
> > > i3c_master_add_i2c_dev() and after that it isn't updated. This can cause 
> > troubles for
> > > HDR-TS modes and when you have i2c devices INDEX(2) on the bus.
> > 
> > Yes, I see this now. It may happen before HC driver updates device list. I
> > should update device list right before i3c_master_register().
> > 
> > > 
> > > > > @@ -2504,9 +2745,11 @@ int i3c_master_register(struct 
> > i3c_master_controller 
> > > > *master,
> > > > >  	 * register I3C devices dicovered during the initial DAA.
> > > > >  	 */
> > > > >  	master->init_done = true;
> > > > > -	i3c_bus_normaluse_lock(&master->bus);
> > > > > -	i3c_master_register_new_i3c_devs(master);
> > > > > -	i3c_bus_normaluse_unlock(&master->bus);
> > > > > +	i3c_master_register_new_devs(master);
> > > > > +
> > > > > +	i3c_bus_maintenance_lock(&master->bus);
> > > > > +	i3c_master_enable_mr_events(master);
> > > 
> > > Why are you enabling MR events here? As a standard function this might case 
> > issues
> > > because the master can support ENEC/DISEC commands but not multi-master 
> > typologies.
> > 
> > I enable it at the end of master registration to be sure that current master 
> > is
> > ready for bus mastership relinquish. If controller does not support secondary
> > master role it can just do nothing with it.
> 
> I think it isn't good idea to have this here because you are forcing HC driver to
> verify it. If it is to be done in subsystem side probably it is better to have a
> master/slave functionalities structure.

If multi-master topology is not supported, request_mastership() hook won't be
implemented and also you will not implement enable/disable_mr_events() hooks.
You don't have to verify it in the driver.

> 
> > 
> > > 
> > > > > +	i3c_bus_maintenance_unlock(&master->bus);
> > > > >  
> > > > >  	return 0;
> > > > >  
> > > > > @@ -2524,6 +2767,30 @@ int i3c_master_register(struct 
> > i3c_master_controller 
> > > > *master,
> > > > >  EXPORT_SYMBOL_GPL(i3c_master_register);
> > > > >  
> > > 
> > > I'm thinking if isn't better to instantiate the bus apart and them register 
> > the secondary master.
> > 
> > It looked like that before but we decided to register everything or nothing.
> 
> I see your point, but for the future, slave implementation, we can have a
> function to instantiate just the bus and another for master or slave.
> 

We can go the same way with slave, and register bus and slave at once. If this
is the case.

> > 
> > > In this way you are able to add DEFSLVS even before the HC has enable MR 
> > events like it is done
> > > with dt devices.
> > 
> > I don't get it. What do you mean "add DEFSLVS"? DEFSLVS should be received 
> > from
> > current master right after ENTDAA. Could you please explain?
> 
> So the current master receive an hot join and send the DEFSLVS, when do you
> add them to the bus? Will you go for the all process to get all dev info and so on?
> 

When current master receives an hot-join, do ENTDAA to enumerate device which
joined the bus and then sends DEFSLVS. This data is stored in secondary master
controller and if secondary master can request mastership, collects all
required informations and adds the devices. It has to collect PID, DEFSLVS does
not provide this information.

> > 
> > > 
> > > Best regards,
> > > Vitor Soares
> > 
> > -- 
> > -- 
> > Przemyslaw Gaj
> > 
> 
> Best regards,
> Vitor Soares
> 

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
