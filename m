Return-Path: <SRS0=72Oz=S7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409DBC43219
	for <linux-i3c@archiver.kernel.org>; Mon, 29 Apr 2019 10:37:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F7112087B
	for <linux-i3c@archiver.kernel.org>; Mon, 29 Apr 2019 10:37:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XpGBZe6r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="Y78sa0gz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="TOJy5XMx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F7112087B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PHCXix0SuruJpqJYGz9DE8BbPQg2n73BJhze4gUUFXM=; b=XpGBZe6r8enhId
	ONqp28kFKzO1e2x31PLpb9hy7xWHI6TgY/v45wd+RGOfR+c5Bcv9yn3FSyACuD4Htf6sb//Fryyr6
	mnflCnua9l3rBsgyXloGvo8VOnieYbrTQdfcUFcOkdHFokPXuFE0zs56KbX7TKXgpQ4cp+pzZwuTN
	ydssUuaAb4oHDfe5H0Hp4HcAT7eqFsrPkZMUmRyf59obOT7mRKsTqHFPOOf30cy9zH+ZhM/QkPWJY
	ZE4Ae5PqhhxuosamphmJZRG3toxqaRXQsEoMUY35Z3WHwDzOjgjHh+x61ar+hA+/YralJAERDbfWl
	6rgqQmWmuZ4p+vqERzCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL3eg-0007my-Kt; Mon, 29 Apr 2019 10:37:02 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL3ed-0007mS-P7
 for linux-i3c@lists.infradead.org; Mon, 29 Apr 2019 10:37:01 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3TAYk7O025164; Mon, 29 Apr 2019 03:36:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=y5A6zbIh+cf7wicdbolxYork6xFaVXcNHpAknXklCIs=;
 b=Y78sa0gzO1zFSGfb0P6h911Q3B8O9iBijUXifiZa33+jcmsbLUfJpZ2DI3VPT9wzyuBS
 s9+y+7yxBQs8riZou+1aY8IpK4uG8kjJ1DHtUNUHm9cVQch3rJkX44IyZuwlsVIchVZu
 0iZyjBDRcf0RwJBO+MrCJvqoJc7wfndwYdZs6rm67rKCYjNj1sJ2Bh/kSLgclCXnnhX5
 uA0b3PeJrsQTtjwhdEzwBkg27krIk8tpFSiQNmGOavMiJ9YLyQNQboU5pn+9sNeNTL5P
 sofkjM95AKOfVCXPdDmVOYOKKGu2CXe3IBO9I2uVgw9gI12Qx01/Xn2XQhmPERWkrXJk zQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2058.outbound.protection.outlook.com [104.47.37.58])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2s5v0u0ucs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 29 Apr 2019 03:36:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5A6zbIh+cf7wicdbolxYork6xFaVXcNHpAknXklCIs=;
 b=TOJy5XMxxDV6HOBDZ8M20h995fXXQLPpl/PR73rfmHr/cSORDm2iL7ljksk5tgjacC5vXK0XE4unFNmZoTF/y8AoA+NIaY9qNhSwPmRnXLAOo8wsL6SehQId4qZw6S5PfSRHEADRKedqgaHubxZEAryBCTiybw0mEEUsjl45JtY=
Received: from DM5PR07CA0117.namprd07.prod.outlook.com (2603:10b6:4:ae::46) by
 SN1PR07MB2304.namprd07.prod.outlook.com (2a01:111:e400:7a45::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.13; Mon, 29 Apr
 2019 10:36:50 +0000
Received: from CO1NAM05FT027.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::204) by DM5PR07CA0117.outlook.office365.com
 (2603:10b6:4:ae::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Mon, 29 Apr 2019 10:36:49 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 CO1NAM05FT027.mail.protection.outlook.com (10.152.96.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.4 via Frontend Transport; Mon, 29 Apr 2019 10:36:48 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x3TAakfI029697
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 29 Apr 2019 03:36:47 -0700
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 29 Apr 2019 03:36:45 -0700
Date: Mon, 29 Apr 2019 11:36:42 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 4/6] i3c: master: cdns: add support for mastership
 request to Cadence I3C master driver.
Message-ID: <20190429103639.GA19777@global.cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-5-pgaj@cadence.com>
 <20190330164409.45e6edfb@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190330164409.45e6edfb@collabora.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(396003)(136003)(2980300002)(189003)(199004)(36092001)(305945005)(23676004)(26826003)(7696005)(7636002)(7736002)(1076003)(2486003)(229853002)(50466002)(356004)(6666004)(5660300002)(8936002)(6916009)(86362001)(956004)(107886003)(476003)(2906002)(126002)(486006)(11346002)(478600001)(6246003)(54906003)(5024004)(53416004)(33656002)(26005)(446003)(3846002)(14444005)(66066001)(47776003)(386003)(58126008)(426003)(6286002)(76176011)(316002)(55016002)(76130400001)(4326008)(70586007)(8676002)(70206006)(6116002)(16526019)(186003)(16586007)(246002)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR07MB2304; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 690f63f9-4139-48fe-f373-08d6cc8e95cd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:SN1PR07MB2304; 
X-MS-TrafficTypeDiagnostic: SN1PR07MB2304:
X-Microsoft-Antispam-PRVS: <SN1PR07MB2304F4B3C1EE6EF714B29B29C2390@SN1PR07MB2304.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0022134A87
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BXJLHT0gYmXdUPvHeGBeR2PMzbnVlVq9CdCELivePDvFX68/wroYxdkwQwjnJRmyYZgxYuhKLslEA1wuPwBYIb1KsI/a9yl0fQL19yH2YTVZDRQiR6z4paq5XS0zwPu2ET6mrWiMY+lNFMcEhFVVIERdLSCH2IWxITxGiEu59k4AO8DOUARSZgiFdwGCpStaE3TfUnRvvC5aS0nQkN3g+pS7uzNnlaegQp2miHByr2TFhTeT1m5hvV+SlSnuyOeLqy1OZ/B6n8rzjG8dzsJXlzPBGoZzcjk6AdDnKTmFmktasumcnD5BfT0O4/8jgJh5P6nlc6xMVzVhLx+BVnnh6nKtm5fEaofNy4z014QxD+9uWMQHDHEJtFZjKUZfJjKLatJgKEnI285gDmi3UD+IXiM9sHGzJj8e2XT735uvWeE=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2019 10:36:48.8507 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 690f63f9-4139-48fe-f373-08d6cc8e95cd
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR07MB2304
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904290077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_033700_055965_CA18A7AC 
X-CRM114-Status: GOOD (  21.11  )
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
Cc: linux-i3c@lists.infradead.org, vitor.soares@synopsys.com,
 rafalc@cadence.com, agolec@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Boris,

I'm sorry for my late response. I hope you remember this thread :-)
I'm implementing this and have some questions.

The 03/30/2019 16:44, Boris Brezillon wrote:
> >  
> > @@ -1274,9 +1353,32 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
> >  
> >  	cdns_i3c_master_enable(master);
> >  
> > +	if (m->secondary) {
> > +		i3c_bus_maintenance_lock(&master->base.bus);
> > +		cdns_i3c_master_update_devs(&master->base);
> > +		i3c_bus_maintenance_unlock(&master->base.bus);
> > +	}
> 
> Okay, I changed my mind on this solution (it's not the first time that
> happens, and unfortunately won't be the last time either :-)). I think
> I don't like the idea of exposing the i3c_bus_maintenance_unlock/lock()
> functions in the end.

Ok :-)

> 
> I'd like to reconsider what you initially proposed: having an
> ->update_devs() hook that is called by the core, except I'd call it
> ->populate_bus().

Ok, we can back to previous approach.

> 
> BTW, there's still something that's unclear to me. You seem to populate
> the bus here and also when acquiring bus ownership. Is this correct?

Yes, this is correct. I'm doing this here to register all the devices received
by DEFSLVS on master initialization time. I'm also populating new devices when
acquiring the bus because some device could join the bus dynamically and we
want to register this new devices on our side also.

> I'd expect it to be 'partially' populated at bus-init+defslvs time,
> which would trigger a mastership request if I3C devices are present (as
> we need to send a GETPID to know more about I3C devs).

So, you want to allocate and attach devices and then, when possible get devices
info and register them? I mean when mastership request is possible. If not,
just leave devices allocated and register them when ENEC(MR) received, correct?

Previously, I allocated and registered all the devices after successful
mastership request. Which way is better in your opinion?

>
> Also, what happens if i3c_master_add_i3c_dev_locked() fails? You
> don't seem to handle that case at all.

For now, I just skipped it silently.

> 
> > +
> > +static void cdns_i3c_master_mastership_takeover(struct cdns_i3c_master *master)
> > +{
> > +	if (master->base.init_done) {
> 
> Can this really happen that init_done is not set when you reach this
> point.

Yes, it was possible. Mastership was taken but master wasn't registered yet.
With new approach I think this won't happen.

> 
> > +		i3c_bus_maintenance_lock(&master->base.bus);
> > +		cdns_i3c_master_update_devs(&master->base);
> > +		i3c_bus_maintenance_unlock(&master->base.bus);
> > +
> > +		i3c_master_register_new_devs(&master->base);
> 
> The core will somehow be informed that this master now owns the bus, so
> it can call i3c_master_register_new_devs() for us, right?

I think it can. I'm sure it worked like that before. When HC driver changed
cur_master, new devices were populated.

> 
> But as said above, I'm not even sure this is correct to do it from
> here. I'd expect this to happen at DEFSLVS or BUS init time.
> 

Ok. New(Previous) approach allows that.

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
