Return-Path: <SRS0=peef=MW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD72AC4338F
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9607B60F01
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9607B60F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eudKmdEoP1Q0Jkm/dLqqJ83a1fFxa/DVYIn2G99TW6c=; b=TajudPC0cJukn+Rbl2UdyN6sMK
	qwH1z9VuCJ7/DzyiLsEm25OB2wczAG7ku5w31cNHEIrFa1aP1WY0PAIe4F/sMW6arQ9ySkSBXgqDj
	3rtAs04FER23tLqitPoVz5NTByv8oatj9sQbBZL2Cc/zshJ+YHCb4rPHGD/rXMY691a6lFeZucwAm
	i9mqkRF5+J5kV1+QSPcMljRBhV12LL7RojBAZrB2xMoJtmII9L7AcdYUJKrwJXonJgE9bxDENXkAc
	ri5zGE+uN++7/v9nWgoazTUsLkt6/ijkIs3TTD4aLfmEmjdNkuUavq8BpKgHLGnbGTqWoKzv/MW1y
	S0uMLHYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YMu-00A8Qs-2F; Fri, 30 Jul 2021 19:40:28 +0000
Received: from mail-bn7nam10on2045.outbound.protection.outlook.com
 ([40.107.92.45] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0j4j-00BEQz-Gx; Tue, 06 Jul 2021 11:17:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OB3jt3SlsdowvqILnghDEybT9vYvyo2iso3STBIJcnupZGT9eEg2Qnje2DqSc1C4mFk2QBNm4Rucxdtyl+OsHUQ/EmMhpY6Ao22yIbNMM+gvlQ8sod5DJX/bxsjpKS6eO4jX3PQu/YQHrM1O+BbrVNmmvyE+/SEjOD6yYppVXkhGxNBjW6Ktv0JvCMebYgktbnIi00Q7kZfMtMhgzlS+RanZh8R3z7epBj+pipCPB70e3UOOw6Nwz1UsTwZdygf++CmCNg4iCcEFQob/F8pbAQCy3wJJMjqKQPM3zCAKa0XQ42hESmNJRNH+Vc9ZPSJZpZVoJ4lnNlD0tHOjILD6vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzQgfqIi8OFdMGOA+iDXYHDenSaYbIa98IiQWdAlr00=;
 b=PbcXlkdCv25iKncBNhz1SQ8QsirUn58/y6c0ZmgRVus/xxMLbQ+eR9VSZ8eS506GpA2/FBfVsZ02guxjIB/XH7j/2OgjjGvg8CvTq+vELmw+UEsn8eda5C/LlejJ5Rvnhlxv9Vq4u8iw3YorMf/V1Kt7r5YEs+kp9iV5eUT8qYCAru8m/eCf7MY/zpu4IWRaIZ7LQCj+ntML2yOrXDI3yBcUIZAzvmFL4gVKSV5hmxR2vbloCwGfZAqDrgsHFQlNeRuHorr7BxChRkbtg6OF6BJIuRJ0pDWVaA3/LNo3ycmIeKRljLZTyAL1xlaE4oBbreAYAPZoCo0uQol2wsMRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzQgfqIi8OFdMGOA+iDXYHDenSaYbIa98IiQWdAlr00=;
 b=Z3JYE8fELRazWIk7bK0Fe6hW3oRwz+8ZoNiqvKNqxw0TiUmV9YgYLWmTeemU+crJ9s959ogLVawNp5FFh0NFupAUqImkuyesyKZ6krt8RQp0pafIPYfEJeBi5PwNZQrwSQE71j7XpY509fW5feJm0I2vmey6PepXF7LKHb7bngzqpGZpC25OkJUH8rsxYnfFV8xQl6Ghb/lArYh0mue5Gb2zdWLqHmfACmiYCdH55M/xrPhSzGYYSQub0JCzJ4tAjheZiYHDU1XpdLgbA7RN6HKQa8wuYTSuNMp4mWqxRaRuihUr41br7D9e6ccszMTT/m1yoBBLIYggYufBgORFww==
Received: from BN6PR14CA0005.namprd14.prod.outlook.com (2603:10b6:404:79::15)
 by DM5PR1201MB0059.namprd12.prod.outlook.com (2603:10b6:4:54::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 11:17:08 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:79:cafe::5) by BN6PR14CA0005.outlook.office365.com
 (2603:10b6:404:79::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Tue, 6 Jul 2021 11:17:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 11:17:06 +0000
Received: from [10.40.102.252] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 6 Jul
 2021 11:16:25 +0000
Subject: Re: [PATCH] bus: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <kernel@pengutronix.de>, <linux-kernel@vger.kernel.org>, Russell King
 <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, Geoff Levand <geoff@infradead.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len
 Brown <lenb@kernel.org>, William Breathitt Gray <vilhelm.gray@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Ben
 Widawsky <ben.widawsky@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, Stefan
 Richter <stefanr@s5r6.in-berlin.de>, Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Wu Hao <hao.wu@intel.com>, Tom
 Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen
 Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Samuel Iglesias Gonsalvez
 <siglesias@igalia.com>, Jens Taprogge <jens.taprogge@taprogge.org>, Johannes
 Thumshirn <morbidrsa@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, Lee Jones <lee.jones@linaro.org>, Tomas
 Winkler <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>, Jakub
 Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jon
 Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>, Kishon Vijay
 Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Dominik Brodowski <linux@dominikbrodowski.net>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>, Mark Gross <mgross@linux.intel.com>, Matt Porter
 <mporter@kernel.crashing.org>, Alexandre Bounine <alex.bou9@gmail.com>, Ohad
 Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Thorsten Scherer <t.scherer@eckelmann.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andy Gross
 <agross@kernel.org>, Mark Brown <broonie@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, Michael Buesch <m@bues.ch>, Sven Van Asbroeck
 <TheSven73@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder
 <elder@kernel.org>, Andreas Noever <andreas.noever@gmail.com>, Michael Jamet
 <michael.jamet@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, Rob Herring <robh@kernel.org>, Jiri
 Slaby <jirislaby@kernel.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Martyn Welch
 <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Johannes Berg
 <johannes@sipsolutions.net>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Marc Zyngier <maz@kernel.org>, Tyrel Datwyler
 <tyreld@linux.ibm.com>, Vladimir Zapolskiy <vz@mleia.com>, Samuel Holland
 <samuel@sholland.org>, Qinglang Miao <miaoqinglang@huawei.com>, Alexey
 Kardashevskiy <aik@ozlabs.ru>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Joey Pabalan <jpabalanb@gmail.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Frank Li
 <lznuaa@gmail.com>, Mike Christie <michael.christie@oracle.com>, Bodo
 Stroesser <bostroesser@gmail.com>, Hannes Reinecke <hare@suse.de>, David
 Woodhouse <dwmw@amazon.co.uk>, SeongJae Park <sjpark@amazon.de>, Julien Grall
 <jgrall@amazon.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-acpi@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
 <linux-cxl@vger.kernel.org>, <nvdimm@lists.linux.dev>,
 <dmaengine@vger.kernel.org>, <linux1394-devel@lists.sourceforge.net>,
 <linux-fpga@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-hyperv@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-i3c@lists.infradead.org>, <industrypack-devel@lists.sourceforge.net>,
 <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-ntb@googlegroups.com>,
 <linux-pci@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <greybus-dev@lists.linaro.org>, <target-devel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-serial@vger.kernel.org>,
 <virtualization@lists.linux-foundation.org>, <kvm@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <f4c5e4c9-95a1-e801-6d2d-6bb18a924b01@nvidia.com>
Date: Tue, 6 Jul 2021 16:46:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d660212b-af0f-4381-7aa8-08d9406f9722
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0059:
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0059F2FD2EA1FF32196093E3DC1B9@DM5PR1201MB0059.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yp+xo1ChYomO5saPmEiiXoTZrpARTWeS+6+ILqneuCodLa6j14xykFNBVNaB4aiSH2d+5MPlJMacyo/bFt8aKcan7CtgrqMd0lAsvFIkZgwuCeKYMsT2Xfmw5J/km/XgptN82DkQln6ltmUSP5rY8bY8C1/13//X6pHRKC7TQ718mAEqrAKf+wNbig3UHNNLoOR6w975lGU5jVv1u1lHKveYETvI1HxLK9EAigj1IS8jiHQwoEUbAJtPyk/0Iyw/umAFVeL1/yiulcjReFcWfGKm4HxeXYHJeqjsbDQ8z58nwPulNCDyrEyI2OAIPYW2DXMjhWpIeFrDWB7LG2y1+dMgZOC5Awev6CyctuFAr8/1dfXCAF/zLNAw+WZe/OqYx/LBwE+uUIq9DNbzkqraj1p2iLhQk6oPB9wR09pr9cHnLBbuxX8n2WvREZhzVDRzS67ljrMLBTDu1SLxxnozXOoYny7NjUfvBOJMFdRHn4z7ivj1lLMqYCjxkQoKa3xuvEsNCSVAsoGhuEc6Dy9sdlluue/2i6NiQirxyNP97b16LmlwAsDu2J1GknqHaGuMnaNt2+f0/PQaAiKJ8Fl+NVNqnUw2Xp0PRXBcfi55eDn1g28TuiXzOCgRh/zVdhr+4Tywc040jRYHJj6OaSzsDUlECeNnvEToseYb+sDgQ1R2LGrW5aEEyqm9q5ftmFVUz7yPSsE172P7P4oFhOBR2K9NffS/ZbkUK/PIiZkGZ+vRBrWH52nHpdCxqybxQFxD
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(36840700001)(46966006)(53546011)(7366002)(7406005)(336012)(7336002)(2906002)(316002)(31686004)(82310400003)(82740400003)(66574015)(4326008)(47076005)(7276002)(86362001)(6666004)(7416002)(7636003)(36756003)(16576012)(8676002)(36860700001)(70586007)(31696002)(356005)(16526019)(186003)(5660300002)(8936002)(70206006)(26005)(2616005)(110136005)(54906003)(426003)(36906005)(478600001)(4744005)(557034005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 11:17:06.9013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d660212b-af0f-4381-7aa8-08d9406f9722
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_041713_771869_373B0DD5 
X-CRM114-Status: GOOD (  17.39  )
X-Mailman-Approved-At: Fri, 30 Jul 2021 12:40:20 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

CgpPbiA3LzYvMjAyMSAzOjIwIFBNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBUaGUgZHJp
dmVyIGNvcmUgaWdub3JlcyB0aGUgcmV0dXJuIHZhbHVlIG9mIHRoaXMgY2FsbGJhY2sgYmVjYXVz
ZSB0aGVyZQo+IGlzIG9ubHkgbGl0dGxlIGl0IGNhbiBkbyB3aGVuIGEgZGV2aWNlIGRpc2FwcGVh
cnMuCj4gCj4gVGhpcyBpcyB0aGUgZmluYWwgYml0IG9mIGEgbG9uZyBsYXN0aW5nIGNsZWFudXAg
cXVlc3Qgd2hlcmUgc2V2ZXJhbAo+IGJ1c2VzIHdlcmUgY29udmVydGVkIHRvIGFsc28gcmV0dXJu
IHZvaWQgZnJvbSB0aGVpciByZW1vdmUgY2FsbGJhY2suCj4gQWRkaXRpb25hbGx5IHNvbWUgcmVz
b3VyY2UgbGVha3Mgd2VyZSBmaXhlZCB0aGF0IHdlcmUgY2F1c2VkIGJ5IGRyaXZlcnMKPiByZXR1
cm5pbmcgYW4gZXJyb3IgY29kZSBpbiB0aGUgZXhwZWN0YXRpb24gdGhhdCB0aGUgZHJpdmVyIHdv
bid0IGdvCj4gYXdheS4KPiAKPiBXaXRoIHN0cnVjdCBidXNfdHlwZTo6cmVtb3ZlIHJldHVybmlu
ZyB2b2lkIGl0J3MgcHJldmVudGVkIHRoYXQgbmV3bHkKPiBpbXBsZW1lbnRlZCBidXNlcyByZXR1
cm4gYW4gaWdub3JlZCBlcnJvciBjb2RlIGFuZCBzbyBkb24ndCBhbnRpY2lwYXRlCj4gd3Jvbmcg
ZXhwZWN0YXRpb25zIGZvciBkcml2ZXIgYXV0aG9ycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgoKCj4gICBkcml2
ZXJzL3ZmaW8vbWRldi9tZGV2X2RyaXZlci5jICAgICAgICAgICB8IDQgKy0tLQoKQWNrZWQtYnk6
IEtpcnRpIFdhbmtoZWRlIDxrd2Fua2hlZGVAbnZpZGlhLmNvbT4KCgotLSAKbGludXgtaTNjIG1h
aWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
