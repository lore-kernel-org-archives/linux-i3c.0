Return-Path: <SRS0=XZWt=SL=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741B6C10F0E
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Apr 2019 15:20:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 424052084F
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Apr 2019 15:20:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HVaU8shZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="dhYvXIRo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="D22Xa4NQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 424052084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zm4yztZpM0mh9Dtp3+yqRjI4Xg1wcJ93HrbpOnkko2g=; b=HVaU8shZEQVj9u
	ExmGp9Wvs0EOt3/FYVSDJT7GBcGHG02359nqqxPOQ7b4ibrvUwLdFyVZ1XuZZoPdtXknHBci7O2xf
	guiQr55cuQxEZZFwWgGjYFzxWs0x2L7nHzUr6T3mU3T4+xanMMKzeCKYeSYBynL86BwC4efGvAXo0
	e94hiOIj/IEEeFhxNUjUnLzn6FdsyNtmLNFFsE16qSD5wwgXDHbfodIwVaLHwSGN7piUfiwWhNp/s
	ULIn4asPuSKaTJyjA+jwy2efdrAqurwVOr1bf5FkVuh8Z5a9IfU4YajX14r7LD1fr6pU0v5ZNCXBH
	BlR2Df3H4Au7bbJUZNXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDsYP-00087V-Sn; Tue, 09 Apr 2019 15:20:53 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDsYK-000874-W8
 for linux-i3c@lists.infradead.org; Tue, 09 Apr 2019 15:20:52 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x39FA56A024088; Tue, 9 Apr 2019 08:20:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=MoGHmkfAApIzNNujV0dFKfVtVLSecw263M67n9ctp7M=;
 b=dhYvXIRo/zadH+15RhjKAmRCu52ymDj+cl5kg5U6ZHUHKkEB7QlAPkUtpnzIH6fEr87L
 HG7EywRyB2QRzPIk0ExqYAuGas0sPPCz/Q74PVIl2epgLeAJZzuVzQRRwXPWUSpb8Xs8
 nNpDfkb6qyPBxHi7C6O0Xb5cai8cFAFpb4m5oaldHOw8TBUB4ACXsJeltmNg0ZLWGOmC
 0TpXdBvVbB8uktBMtqhXYsXWZ+yEj8jx7zCmsCJ/1cM+SpQpXV55SV2Ef5zWFDYiqKR7
 Vsd/xiQfCndEgYB+VlNE8K7P/Q5mRhHJRWx0GhBuw2qBItM8Ddq5xRRk0s97X80ZV4ij eg== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-by2-obe.outbound.protection.outlook.com
 (mail-by2nam05lp2058.outbound.protection.outlook.com [104.47.50.58])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2rr9dfvwf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Apr 2019 08:20:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoGHmkfAApIzNNujV0dFKfVtVLSecw263M67n9ctp7M=;
 b=D22Xa4NQrPLNAXNuZHq49NWOvhYpv3VNLoaVVbAzC1IyDPZKnRtZEUNYxkQ7rNLTXU2jVmFGL3tJxu6tMbZmLjhz/w8YPU7935nVwnGr7ilFg6pFhPxuUnLjRbaIURwxPeAMYzWfdTUAaafoPAGPwT68NRxdHfcYXm7OxmNzYTg=
Received: from BN8PR07CA0018.namprd07.prod.outlook.com (2603:10b6:408:ac::31)
 by SN1PR07MB2301.namprd07.prod.outlook.com (2a01:111:e400:7a45::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1771.21; Tue, 9 Apr
 2019 15:20:41 +0000
Received: from CO1NAM05FT004.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::201) by BN8PR07CA0018.outlook.office365.com
 (2603:10b6:408:ac::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1771.16 via Frontend
 Transport; Tue, 9 Apr 2019 15:20:41 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT004.mail.protection.outlook.com (10.152.96.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1792.7 via Frontend Transport; Tue, 9 Apr 2019 15:20:40 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x39FKaiW002012
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 9 Apr 2019 11:20:37 -0400
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 9 Apr 2019 08:20:33 -0700
Date: Tue, 9 Apr 2019 16:20:30 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Vitor Soares <vitor.soares@synopsys.com>
Subject: Re: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190409152028.GA8934@global.cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-4-pgaj@cadence.com>
 <06a6f65b-a397-27c9-fa4f-e2147080be12@synopsys.com>
 <13D59CF9CEBAF94592A12E8AE55501350A61307C@DE02WEMBXB.internal.synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13D59CF9CEBAF94592A12E8AE55501350A61307C@DE02WEMBXB.internal.synopsys.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39850400004)(376002)(396003)(346002)(136003)(2980300002)(36092001)(189003)(199004)(8936002)(3846002)(106466001)(50466002)(81156014)(2906002)(8676002)(81166006)(76176011)(6116002)(5660300002)(16586007)(76130400001)(53416004)(305945005)(97736004)(58126008)(69596002)(54906003)(229853002)(68736007)(316002)(7696005)(7736002)(2486003)(23676004)(105596002)(55016002)(93886005)(6916009)(33656002)(6286002)(478600001)(476003)(186003)(486006)(126002)(446003)(956004)(11346002)(53936002)(1076003)(14444005)(426003)(86362001)(107886003)(26826003)(386003)(4326008)(47776003)(336012)(6246003)(66066001)(356004)(26005)(16526019);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR07MB2301; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b22e1ec-e0e3-45fd-c065-08d6bcfeed35
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:SN1PR07MB2301; 
X-MS-TrafficTypeDiagnostic: SN1PR07MB2301:
X-Microsoft-Antispam-PRVS: <SN1PR07MB2301E13F21514317B783D246C22D0@SN1PR07MB2301.namprd07.prod.outlook.com>
X-Forefront-PRVS: 000227DA0C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: kxjbQPPN3Jr3+78NZWZXlC7GCMhoiA6EpIsAiLppdt9Qq6rV94xN40fUJBrxHBEs8a3TMf5vrO5d2hI6QMsUdP7xwspc1wziYqh7H3Ns4QL9zHw0e2ewZM//6p0DHMFJ2Ko92Q78dYUmD0TresfggSW5tWG+Ger6updSjRrPCgg8Dsxf2PY3cBPbeKHQBwopEzc3vFHS1p8JAhu0wbG7D4E80yachgKL74wC0cYxmA7KWYWLUmWxt+kbORV2//H2di7yylHAuz0yj7rh+/PzG6Dps1Au2LJx4Q/RF2niXAnteinE02EHW2fV3DLnYpDckkXCP4mTMtHVFHvCJ1mdn8teYTsJmTCIJzjGAMFO71uSeJZiRbckkj846ezGZJ3hCVXnjj5g5+twSKPMlehpK6SPq8tlcCseoW53Ct6mLno=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2019 15:20:40.3976 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b22e1ec-e0e3-45fd-c065-08d6bcfeed35
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR07MB2301
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-09_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904090096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_082050_034299_815D6E09 
X-CRM114-Status: GOOD (  23.64  )
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

The 04/09/2019 14:31, Vitor Soares wrote:
> 
> Hi Przemek,
> 
> From my analyses you do i3c_master_register for secondary master in follow cases:
> - HC has already an dynamic address and it is the owner of the bus.

Correct. It requests bus ownership before registration, if DA is assigned.

> Or 
> - when it receive MR event enabled

Actually, when MR event is enabled and secondary master is not initialized yet.

> 
> Is this correct?
> 
> From: vitor <soares@synopsys.com>
> Date: Mon, Apr 01, 2019 at 19:41:39
> 
> > Hi Przemek,
> > 
> > > +/**
> > >   * i3c_master_register() - register an I3C master
> > >   * @master: master used to send frames on the bus
> > >   * @parent: the parent device (the one that provides this I3C master
> > >   *	    controller)
> > >   * @ops: the master controller operations
> > > - * @secondary: true if you are registering a secondary master. Will return
> > > - *	       -ENOTSUPP if set to true since secondary masters are not yet
> > > - *	       supported
> > > + * @secondary: true if you are registering a secondary master.
> > >   *
> > >   * This function takes care of everything for you:
> > >   *
> > > @@ -2427,10 +2672,6 @@ int i3c_master_register(struct i3c_master_controller 
> > *master,
> > >  	struct i2c_dev_boardinfo *i2cbi;
> > >  	int ret;
> > >  
> > > -	/* We do not support secondary masters yet. */
> > > -	if (secondary)
> > > -		return -ENOTSUPP;
> > > -
> > >  	ret = i3c_master_check_ops(ops);
> > >  	if (ret)
> > >  		return ret;
> 
> The bus mode is set before the sec master does i3c_master_add_i3c_dev_locked() and
> i3c_master_add_i2c_dev() and after that it isn't updated. This can cause troubles for
> HDR-TS modes and when you have i2c devices INDEX(2) on the bus.

Yes, I see this now. It may happen before HC driver updates device list. I
should update device list right before i3c_master_register().

> 
> > > @@ -2504,9 +2745,11 @@ int i3c_master_register(struct i3c_master_controller 
> > *master,
> > >  	 * register I3C devices dicovered during the initial DAA.
> > >  	 */
> > >  	master->init_done = true;
> > > -	i3c_bus_normaluse_lock(&master->bus);
> > > -	i3c_master_register_new_i3c_devs(master);
> > > -	i3c_bus_normaluse_unlock(&master->bus);
> > > +	i3c_master_register_new_devs(master);
> > > +
> > > +	i3c_bus_maintenance_lock(&master->bus);
> > > +	i3c_master_enable_mr_events(master);
> 
> Why are you enabling MR events here? As a standard function this might case issues
> because the master can support ENEC/DISEC commands but not multi-master typologies.

I enable it at the end of master registration to be sure that current master is
ready for bus mastership relinquish. If controller does not support secondary
master role it can just do nothing with it.

> 
> > > +	i3c_bus_maintenance_unlock(&master->bus);
> > >  
> > >  	return 0;
> > >  
> > > @@ -2524,6 +2767,30 @@ int i3c_master_register(struct i3c_master_controller 
> > *master,
> > >  EXPORT_SYMBOL_GPL(i3c_master_register);
> > >  
> 
> I'm thinking if isn't better to instantiate the bus apart and them register the secondary master.

It looked like that before but we decided to register everything or nothing.

> In this way you are able to add DEFSLVS even before the HC has enable MR events like it is done
> with dt devices.

I don't get it. What do you mean "add DEFSLVS"? DEFSLVS should be received from
current master right after ENTDAA. Could you please explain?

> 
> Best regards,
> Vitor Soares
> 
> 
> 
> 
> 
> 
> 
> 

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
